package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.EgbilLot;
import integra.models.EgbilObject;
import integra.models.RegisterUnit;
import play.mvc.Controller;

import java.util.List;

public class IntegraJson extends Controller {
    private static Integra integra = IntegraServer.createServer();

    public static void getRegisterUnits(){
        List<RegisterUnit> result = integra.getRegisterUnits();
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrgib(String jrgib) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrgib(jrgib);
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrb(jrb);
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrl(String jrl) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrl(jrl);
        renderJSON(result);
    }

    public static void getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnit> result = integra.getRegisterUnitsByJrg(jrg);
        renderJSON(result);
    }

    public static void getLotsByNumber(String number) {
        List<EgbilLot> result = integra.getLotsByNumber(number);
        renderJSON(result);
    }

    public static void getEgbilObject(String type, String name) {
        EgbilObject result = integra.getEgbilObject(type, name);
        renderJSON(result);
    }
}
