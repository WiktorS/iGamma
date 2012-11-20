package integra;

import com.sun.jna.Pointer;

public abstract class IntegraJnaConnectionWorker {

    public IntegraJnaConnectionWorker(IntegraJnaConnectionPool integraJnaConnectionPool) {
        IntegraJnaConnection integraConnection = integraJnaConnectionPool.GetAvailableConnection();
        try {
            if (integraConnection != null) {
                Pointer integraConnectionPtr = integraConnection.GetIntegraConnection();
                if (integraConnectionPtr != null) {
                    synchronized (integraConnectionPtr) {
                        run(integraConnectionPtr);
                    }
                }
            }
        }
        finally {
            if (integraConnection != null) {
                integraConnection.SetInUse(false);
                //notify waiting connections
                synchronized (integraJnaConnectionPool) {
                    integraJnaConnectionPool.notifyAll();   //TODO: WS. Maybe only notify()?
                }
            }
        }
    }

    public abstract void run(Pointer integraConnectionPtr);
}
