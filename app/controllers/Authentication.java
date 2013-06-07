package controllers;

import controllers.helpers.Admin;
import models.User;
import models.UserSessionData;
import play.Logger;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Util;
import play.utils.Java;

import java.lang.reflect.Method;

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

    // Every call is checked for authentication
    @Before(unless={"login","logout"})
    private static void checkAuthentication() throws Throwable {
        UserSessionData userSessionData;
        //Check if there is already a session
        userSessionData = Cache.get(session.getId(), UserSessionData.class);
        if (userSessionData == null) {
            forbidden("Bad authenticity token");
        }
        Http.Header headerToken = request.headers.get("x-csrftoken");
        if(headerToken == null) {
            Logger.warn("Missing token header detected!");
            forbidden("Bad authenticity token");
        }
        //check header token
        else if (!session.getAuthenticityToken().equals(headerToken.value())){
            Logger.warn("Invalid header token detected!");
            forbidden("Bad authenticity token");
        }
        //check cache token
        else if (!userSessionData.authToken.equals(session.getAuthenticityToken())) {
            Logger.warn("Invalid cache token detected!");
            forbidden("Bad authenticity token");
        }
        //Methods annotated with Admin can only be accessed by user with admin permissions
        Method actionMethod = Java.findActionMethod(request.actionMethod, getControllerClass());
        if (actionMethod.isAnnotationPresent(Admin.class)) {
            if ((userSessionData.permissions & User.PERMISSION_ADMIN) != User.PERMISSION_ADMIN) {
                forbidden();
            }
        }
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
                userSessionData.permissions = user.permissions;
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
