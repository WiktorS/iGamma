package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.RegisterUnit;
import play.mvc.*;

import java.util.List;

public class Application extends Controller {

    public static void index() {
        render();
    }

    public static void getRegisterUnits() {
        Integra integra = IntegraServer.createServer();
        List<RegisterUnit> result = integra.getRegisterUnits();
        renderJSON(result);
    }
}