package controllers.helpers;

import play.Logger;
import play.Play;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.Util;

public class HttpsRequired extends Controller {
    private static String SSL_HEADER_CLOUD_FOUNDRY = "x-forwarded-proto";
    /** Called before every request to ensure that HTTPS is used. */
    @Before
    public static void redirectToHttps() {
        //if it's not secure, but Heroku has already done the SSL processing then it might actually be secure after all
        if (!request.secure && request.headers.get(SSL_HEADER_CLOUD_FOUNDRY) != null) {
            request.secure = request.headers.get(SSL_HEADER_CLOUD_FOUNDRY).values.contains("https");
        }
        //redirect if it's not secure
        if (!request.secure) {
            if (request.method.equals("GET")) {
                String url = redirectHostHttps() + request.url;
                Logger.debug("Redirecting to secure: " + url);
                redirect(url);
            }
            else {
                forbidden();
            }
        }
    }

    /** Renames the host to be https:// */
    @Util
    public static String redirectHostHttps() {
        String host = request.host;
        if (host.contains(":")) {
            host = host.split(":")[0];
        }
        String httpsPort = (String) Play.configuration.get("https.port");
        if (httpsPort != null && !httpsPort.isEmpty() && Integer.valueOf(httpsPort) != 443)
            host += ":" + httpsPort;
        return "https://" + host;
    }
}