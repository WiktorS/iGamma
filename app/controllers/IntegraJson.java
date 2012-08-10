package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.RegisterUnit;
import play.mvc.Controller;

import java.util.List;

public class IntegraJson extends Controller {
    private static Integra integra = IntegraServer.createServer();

    public static void getRegisterUnits(){
        List<RegisterUnit> result = integra.getRegisterUnits();
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrb(jrb);
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrg(jrg);
        renderJSON(result);
    }
}
