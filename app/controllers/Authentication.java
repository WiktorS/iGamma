package controllers;

import models.User;
import models.UserSessionData;
import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.Util;

//TODO: These functions should check if they are called with secure channel
//@With(HttpsRequired.class)
public class Authentication extends Controller {
    @Util
    private static User getUser(String username, String password) {
        User user = null;
        user = User.find("byLogin", username).first();
        if (user != null && user.isActive && user.isValidPassword(password)) {
            return user;
        }
        return null;
    }

    public static void login() {
        if (request.user == null || request.password == null)
            unauthorized("Dostęp wymaga podania poświadczeń");
        else {
            User user = null;
            user = getUser(request.user, request.password);
            if (null != user) {
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
                userSessionData.userName = user.login;
                userSessionData.fullName = user.firstName + " " + user.lastName;
                userSessionData.authToken = session.getAuthenticityToken();
                //make a change to session to force cookie
                session.put("username", userSessionData.userName);
                Cache.safeSet(session.getId(), userSessionData, "1d");
                //
                renderJSON(userSessionData);
            }
            else {
                forbidden("Niepoprawna nazwa użytkownika lub hasło");
            }
        }
    }

    public static void logout() {
        Cache.safeDelete(session.getId());
        session.clear();
        ok();
    }
}
