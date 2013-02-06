package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.QueryEntry;
import integra.models.*;
import play.mvc.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class IntegraJson extends Controller {
    private static Integra integra = IntegraServer.createServer();

    //Transform params to QueryEntryList (exclude params which are not needed)
    private static List<QueryEntry> getQueryEntryList() {
        Map<String, String> paramsMap = params.allSimple();
        List<QueryEntry> queryEntryList = new ArrayList<QueryEntry>();
        List<String> excludeList = Arrays.asList("type", "body");
        for (Map.Entry<String, String> entry : paramsMap.entrySet()) {
            if (!excludeList.contains(entry.getKey())) {
                queryEntryList.add(new QueryEntry(entry.getKey(), entry.getValue()));
            }
        }
        return queryEntryList;
    }

    public static void findObjects(String queryName, QueryEntry[] queryArgs) throws Exception {
        List<Long> result = integra.findObjects(queryName, queryArgs);
        renderJSON(result);
    }

    public static void getRegisterUnits(String type) throws Exception {
        List<RegisterUnit> result = integra.getRegisterUnits(type);
        renderJSON(result);
    }

    public static void getLotsByNumber(String number) throws Exception {
        List<Lot> result = integra.getLotsByNumber(number);
        renderJSON(result);
    }

    public static void getBuildings(long idList[]) throws Exception {
        List<Building> result = integra.getBuildings(idList);
        renderJSON(result);
    }

    public static void getLocalByNumber(String numberL) throws Exception {
        List<Local> result = integra.getLocalByNumber(numberL);
        renderJSON(result);
    }

    public static void getPersonByPesel(String pesel) throws Exception {
        List<Person> result = integra.getPersonByPesel(pesel);
        renderJSON(result);
    }

    public static void getInstitutionByNip(String nip) throws Exception {
        List<Institution> result = integra.getInstitutionByNip(nip);
        renderJSON(result);
    }

    public static void getGroupByNip(String nip) throws Exception {
        List<Group> result = integra.getGroupByNip(nip);
        renderJSON(result);
    }

    public static void getLandCommunities(String name) throws Exception {
        List<LandCommunity> result = integra.getLandCommunities(name);
        renderJSON(result);
    }

    public static void getEgbilObject(String type, String name) throws Exception {
        EgbilObject result = integra.getEgbilObject(type, name);
        renderJSON(result);
    }

    public static void getDocuments(String unknown) throws Exception {
        List<EgbilDocument> result = integra.getDocuments();
        renderJSON(result);
    }

    public static void getSystematics(long[] parentIdList) throws Exception {
        List<Systematic> result = integra.getSystematics(parentIdList);
        renderJSON(result);
    }

    public static void getShareSummary() throws Exception {
        List<ShareSummary> result = integra.getShareSummary();
        renderJSON(result);
    }

    public static void getCustomReportData(String type, String name) throws Exception {
        CustomReportData result = integra.getCustomReportData(type, name);
        renderJSON(result);
    }

    public static void getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception {
        List<EgbilObjectData> result = integra.getRelatedObjects(relation, objectList);
        renderJSON(result);
    }

    public static void getTerrainCategorySummary(String objectType, String objectName) throws Exception {
        renderText("ZESTAWIENIE KLASOUŻYTKÓW");
    }

    public static void getReservation(String objectType, String objectName) throws Exception {
        renderText("REZERWACJA NUMERÓW");
    }

    public static void getCustomReport(Boolean attributeLegend, String lineBreak, String fileFormat, CustomReportAttribute[] attributeList) throws Exception {
        renderText("RAPORT DOWOLNY");
    }

    public static void getDifferenceReport(String reportType, Boolean attribute, Boolean registerUnit, Boolean share, Boolean lot, Boolean building, Boolean local) throws Exception {
        renderText("RAPORT RÓŻNIC");
    }

    public static void getScan(String objectType, String objectName) throws Exception {
        renderText("SKAN");
    }

}