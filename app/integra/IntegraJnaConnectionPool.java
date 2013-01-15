package integra;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;
import integra.jna.IGammaJNALibrary;
import play.Logger;

import java.util.ArrayList;
import java.util.List;

public class IntegraJnaConnectionPool {
    private final List<IntegraJnaConnection> connectionPool = new ArrayList<IntegraJnaConnection>();

    private Pointer NewConnection() {
        PointerByReference refIntegraConnection = new PointerByReference();
        PointerByReference refErrorMsg = new PointerByReference();
        int errCode = IGammaJNALibrary.iGammaJnaConnect(IntegraServer.integraOdbcName,
                IntegraServer.integraOdbcUser, IntegraServer.integraOdbcPass,
                IntegraServer.integraUser, IntegraServer.integraPass, refIntegraConnection, refErrorMsg);
        if (errCode != 0) {
            Pointer errorMsg = refErrorMsg.getValue();
            Logger.error(IntegraJna.AnsiPszToString(errorMsg));
            IGammaJNALibrary.iGammaJnaFree(errorMsg);
        }
        return refIntegraConnection.getValue();
    }

    private boolean CloseConnection(Pointer connection) {
        boolean result = false;
        if (connection != null) {
            synchronized (connection) {
                int errCode = IGammaJNALibrary.iGammaJnaDisconnect(connection);
                result = (errCode == 0);
            }
            if (!result) {
                Logger.debug("Failed to close iGamma connection");
        }
        }
        return result;
    }

    public IntegraJnaConnectionPool() {
    }

    public void FreeConnections() {
        synchronized (connectionPool) {
            for (IntegraJnaConnection connection : connectionPool) {
                if (!connection.IsInUse()) {
                    if (!CloseConnection(connection.GetIntegraConnection())) {
                        Logger.debug("Failed to close connection(%d)", connectionPool.indexOf(connection));
                    }
                }
                else {
                    Logger.debug("Found locked connection(%d)", connectionPool.indexOf(connection));
                }
            }
            connectionPool.clear();
        }
    }

    public IntegraJnaConnection GetAvailableConnection() {
        IntegraJnaConnection freeConnection = null;
        while (freeConnection == null)
        {
            synchronized (connectionPool) {
                for (IntegraJnaConnection connection : connectionPool) {
                    if (!connection.IsInUse()) {
                        connection.SetInUse(true);
                        freeConnection = connection;
                        break;
                    }
                }
            }
            if (freeConnection == null) {
                Logger.debug("[%08x] No idle connection found", Thread.currentThread().getId());
                synchronized (connectionPool) {
                    if (connectionPool.size() < IntegraServer.integraPoolMaxSize) {
                        Pointer connection = NewConnection();
                        if (connection != null) {
                            freeConnection = new IntegraJnaConnection(connection);
                            freeConnection.SetInUse();
                            connectionPool.add(freeConnection);
                            Logger.debug("[%08x] Added new connection [%d/%d]", Thread.currentThread().getId(), connectionPool.size(),IntegraServer.integraPoolMaxSize);
                        }
                        else {
                            Logger.debug("[%08x] Failed to initialize new connection [%d/%d]", Thread.currentThread().getId(), connectionPool.size(),IntegraServer.integraPoolMaxSize);
                            if (connectionPool.size() == 0)
                                //If pool is empty get out of here, something is wrong
                                break;
                        }
                    }
                    else {
                        Logger.debug("[%08x] The pool is full [%d/%d]", Thread.currentThread().getId(), connectionPool.size(),IntegraServer.integraPoolMaxSize);
                    }
                }
            }
            else {
                //Connection found - try to close expired connections
                synchronized (connectionPool) {
                    int i = connectionPool.size();
                    while (i-- > 0  && connectionPool.size() > IntegraServer.integraPoolMinSize) {
                        IntegraJnaConnection connection = connectionPool.get(i);
                        if (!connection.IsInUse() && !connection.IsValid()) {
                            if (!CloseConnection(connection.GetIntegraConnection())) {
                                Logger.debug("[%08x] Failed to close idle connecion(%i)", Thread.currentThread().getId(), i);
                            }
                            //We remove close-failed connection too - some thing is wrong with them! (although it shouldn't happen)
                            connectionPool.remove(i);
                            Logger.debug("[%08x] Removed idle connecion [%d/%d]", Thread.currentThread().getId(), connectionPool.size(),IntegraServer.integraPoolMaxSize);
                            break;  //close only one connection to minimize delay caused by releasing resources
                        }
                    }
                }
            }
            if (freeConnection == null) {
                Logger.debug("[%08x] Waiting for free connection", Thread.currentThread().getId());
                synchronized (connectionPool) {
                    try {
                        connectionPool.wait();
                    }
                    catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return freeConnection;
    }
}
