package controllers;

import models.UserSessionData;
import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.Util;

//@With(HttpsRequired.class)
public class Authentication extends Controller {

    @Util
    private static boolean checkCredentials(String username, String password) {
        //TODO
        return (username.equals("123") && password.equals("asdf"));
    }

    public static void login() {
        if (request.password == null)
            unauthorized("Dostęp wymaga podania poświadczeń");
        else if (checkCredentials(request.user, request.password)) {
            UserSessionData userSessionData;
            //Check if there is already a session
            userSessionData = Cache.get(session.getId(), UserSessionData.class);
            if (userSessionData != null) {
                //this is strange, lets close current and open new one
                Cache.safeDelete(session.getId());
                session.clear();
            }
            //New session data
            userSessionData = new UserSessionData();
            userSessionData.userName = request.user;
            userSessionData.fullName = "Użyszkodnik Jakiś";
            userSessionData.authToken = session.getAuthenticityToken();
            //make a change to session to force cookie
            session.put("username", request.user);
            Cache.safeSet(session.getId(), userSessionData, "1h"); //TODO: How long?
            //
            renderJSON(userSessionData);
        }
        else {
            forbidden("Niepoprawna nazwa użytkownika lub hasło");
        }
    }

    public static void logout() {
        Cache.safeDelete(session.getId());
        session.clear();
        ok();
    }
}
