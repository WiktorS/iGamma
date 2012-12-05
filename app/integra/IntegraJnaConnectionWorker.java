package integra;

import com.sun.jna.Pointer;

public abstract class IntegraJnaConnectionWorker {

    public IntegraJnaConnectionWorker(IntegraJnaConnectionPool integraJnaConnectionPool) throws Exception {
        IntegraJnaConnection integraConnection = integraJnaConnectionPool.GetAvailableConnection();
        try {
            Pointer integraConnectionPtr = null;
            if (integraConnection != null) {
                integraConnectionPtr = integraConnection.GetIntegraConnection();
            }
            if (integraConnection != null && integraConnectionPtr != null) {
                synchronized (integraConnectionPtr) {
                    run(integraConnectionPtr);
                }
            }
            else {
                throw new Exception("Failed to initialize connection with Integra");
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
