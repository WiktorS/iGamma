package controllers;

import models.UserSessionData;
import play.cache.Cache;
import play.mvc.Controller;

public class Application extends Controller {

    //@CacheFor("1h")
    public static void index() {
        UserSessionData userSessionData = Cache.get(session.getId(), UserSessionData.class);
        render(userSessionData);
    }
}