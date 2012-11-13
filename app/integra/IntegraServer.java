package integra;

import play.Play;

public class IntegraServer {
    public static int integraPoolMinSize = getIntProperty("integra.poll.minSize");
    public static int integraPoolMaxSize = getIntProperty("integra.poll.maxSize");

    public static String integraSource = getProperty("integra.source");

    public static String integraOdbcName = getProperty("integra.odbc.name");
    public static String integraOdbcUser = getProperty("integra.odbc.user");
    public static String integraOdbcPass = getProperty("integra.odbc.pass");

    public static String integraUser = getProperty("integra.user");

    public static String integraName = getProperty("integra.pass");

    private static String getProperty(String property) {
        String result;
        result = System.getProperty(property);
        if (result == null || result.isEmpty())
            result = Play.configuration.getProperty(property);
        return result;
    }

    private static int getIntProperty(String property) {
        String result;
        result = System.getProperty(property);
        if (result == null || result.isEmpty())
            result = Play.configuration.getProperty(property);
        return Integer.valueOf(result);
    }

    public static Integra createServer() {
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
