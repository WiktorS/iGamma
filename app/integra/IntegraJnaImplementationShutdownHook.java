package integra;

public class IntegraJnaImplementationShutdownHook extends Thread{
    public IntegraJnaConnectionPool integraJnaConnectionPool;

    @Override
    public void run() {
        if (integraJnaConnectionPool != null)
            integraJnaConnectionPool.FreeConnections();
    }
}
