package integra;

import play.Logger;
import play.Play;

public class IntegraServer {
    public static final int integraPoolMinSize = getIntProperty("integra.poll.minSize");
    public static final int integraPoolMaxSize = getIntProperty("integra.poll.maxSize");
    public static final int integraPoolConnectionMaxValidTime = getIntProperty("integra.poll.connectionMaxValidTime");

    public static final String integraSource = getProperty("integra.source");

    public static final String integraOdbcName = getProperty("integra.odbc.name");
    public static final String integraOdbcUser = getProperty("integra.odbc.user");
    public static final String integraOdbcPass = getProperty("integra.odbc.pass");

    public static final String integraUser = getProperty("integra.user");

    public static final String integraPass = getProperty("integra.pass");

    private static String getProperty(String property) {
        String result;
        result = System.getProperty(property);
        if (result == null)
            result = Play.configuration.getProperty(property);
        return result;
    }

    private static int getIntProperty(String property) {
        String result;
        result = System.getProperty(property);
        if (result == null)
            result = Play.configuration.getProperty(property);
        if (result == null)
            return 0;
        return Integer.valueOf(result);
    }

    public static Integra createServer() {
        Logger.info("Using source: '%s'", integraSource);
        if (integraSource.equals("mock")) {
            return new IntegraMock();
        }
        else if (integraSource.equals("jna")) {
            return new IntegraJnaImplementation();
        }
        else {
            return new IntegraImplementation();
        }
    }
}
