package controllers;

import integra.Integra;
import integra.models.RegisterUnit;
import play.Play;
import play.libs.F;
import play.mvc.Controller;

import java.util.List;

public class IntegraJson extends Controller {
    private static Integra integra = new Integra(Play.configuration.getProperty("integra.url"));

    public static void getRegisterUnits() throws InterruptedException {
        List<RegisterUnit> result = integra.getRegisterUnits();
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrg(jrg);
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrg(jrb);
        renderJSON(result);
    }
}
