package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.RegisterUnit;
import play.mvc.Controller;

import java.util.List;

public class IntegraJson extends Controller {

    public static void getRegisterUnits() {
        Integra integra = IntegraServer.createServer();
        List<RegisterUnit> result = integra.getRegisterUnits();
        renderJSON(result);
    }
}