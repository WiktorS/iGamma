package controllers;

import models.RegisterUnitMock;
import play.mvc.Controller;

import java.util.List;

public class IntegraMockJson extends Controller {

    public static void index() {
        render();
    }

    public static void getRegisterUnits() {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.findAll();
        renderJSON(registerUnitMocks);
    }

    public static void getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrb = ?", jrb).fetch();
        renderJSON(registerUnitMocks);
    }

    public static void getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrg = ?", jrg).fetch();
        renderJSON(registerUnitMocks);
    }

    public static void getRegisterUnitsByJrl(String jrl) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrl = ?", jrl).fetch();
        renderJSON(registerUnitMocks);
    }

    public static void getLotsByNumber(String number) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("number = ?", number).fetch();
        renderJSON(registerUnitMocks);
    }
}
