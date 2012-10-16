package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.*;
import play.mvc.Controller;

import java.util.List;

public class IntegraJson extends Controller {
    private static Integra integra = IntegraServer.createServer();

    public static void getRegisterUnits(String type){
        List<RegisterUnit> result = integra.getRegisterUnits(type);
        renderJSON(result);
    }

    public static void getLotsByNumber(String number) {
        List<Lot> result = integra.getLotsByNumber(number);
        renderJSON(result);
    }

    public static void getBuildingByNumber(String numberB) {
        List<Building> result = integra.getBuildingByNumber(numberB);
        renderJSON(result);
    }

    public static void getLocalByNumber(String numberL) {
        List<Local> result = integra.getLocalByNumber(numberL);
        renderJSON(result);
    }

    public static void getPersonByPesel(String pesel) {
        List<Person> result = integra.getPersonByPesel(pesel);
        renderJSON(result);
    }

    public static void getInstitutionByNip(String nip) {
        List<Institution> result = integra.getInstitutionByNip(nip);
        renderJSON(result);
    }

    public static void getGroupByNip(String nip) {
        List<Group> result = integra.getGroupByNip(nip);
        renderJSON(result);
    }

    public static void getLandCommunities(String name) {
        List<LandCommunities> result = integra.getLandCommunities(name);
        renderJSON(result);
    }

    public static void getEgbilObject(String type, String name) {
        EgbilObject result = integra.getEgbilObject(type, name);
        renderJSON(result);
    }

    public static void getDocuments(String unknown) {
        List<EgbilDocument> result = integra.getDocuments();
        renderJSON(result);
    }

    public static void getSystematics() {
        List<Systematics> result = integra.getSystematics();
        renderJSON(result);
    }

    public static void getShareAccounting() {
        List<ShareAccounting> result = integra.getShareAccounting();
        renderJSON(result);
    }

    public static void getTerrainCategorySummary(String objectType, String objectName) {
        renderText("ZESTAWIENIE KLASOUŻYTKÓW");
    }
}
