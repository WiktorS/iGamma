package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.QueryEntry;
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

    public static void getBuildings(long idList[]) throws Exception {
        List<Building> result = integra.getBuildings(idList);
        renderJSON(result);
    }

    public static void getDocuments(long idList[]) throws Exception {
       List<Document> result = integra.getDocuments(idList);
       renderJSON(result);
    }

    public static void getGroups(long idList[]) throws Exception {
       List<Group> result = integra.getGroups(idList);
       renderJSON(result);
    }

    public static void getPersons(long idList[]) throws Exception {
       List<Person> result = integra.getPersons(idList);
       renderJSON(result);
    }

    public static void getInstitutions(long idList[]) throws Exception {
       List<Institution> result = integra.getInstitutions(idList);
       renderJSON(result);
    }

    public static void getJrg(long idList[]) throws Exception {
       List<RegisterUnit> result = integra.getJrg(idList);
       renderJSON(result);
    }

    public static void getJrb(long idList[]) throws Exception {
       List<RegisterUnit> result = integra.getJrb(idList);
       renderJSON(result);
    }
    
    public static void getJrl(long idList[]) throws Exception {
       List<RegisterUnit> result = integra.getJrl(idList);
       renderJSON(result);
    }

    public static void getOldJrg(long idList[]) throws Exception {
       List<RegisterUnit> result = integra.getOldJrg(idList);
       renderJSON(result);
    }

    public static void getLandCommunities(long idList[]) throws Exception {
       List<LandCommunity> result = integra.getLandCommunities(idList);
       renderJSON(result);
    }

    public static void getLocals(long idList[]) throws Exception {
       List<Local> result = integra.getLocals(idList);
       renderJSON(result);
    }

    public static void getLots(long idList[]) throws Exception {
       List<Lot> result = integra.getLots(idList);
       renderJSON(result);
    }

    public static void getAddresses(long idList[]) throws Exception {
       List<Address> result = integra.getAddresses(idList);
       renderJSON(result);
    }

    public static void getShares(long idList[]) throws Exception {
        List<Share> result = integra.getShares(idList);
        renderJSON(result);
    }

    public static void getChanges(long idList[]) throws Exception {
        List<Change> result = integra.getChanges(idList);
        renderJSON(result);
    }

    public static void getSystematics(long[] parentIdList) throws Exception {
        List<Systematic> result = integra.getSystematics(parentIdList);
        renderJSON(result);
    }

//    public static void getShareSummary() throws Exception {
//       List<ShareSummary> result = integra.getShareSummary();
//       renderJSON(result);
//    }
//
//    public static void getCustomReportData(String type, String name) throws Exception {
//       CustomReportData result = integra.getCustomReportData(type, name);
//       renderJSON(result);
//    }

    // public static void getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception {
    //    List<EgbilObjectData> result = integra.getRelatedObjects(relation, objectList);
    //    renderJSON(result);
    // }

    public static void getTerrainCategorySummary(String objectType, String objectName) throws Exception {
        renderText("ZESTAWIENIE KLASOUŻYTKÓW");
    }

    public static void getReservation(String objectType, String objectName) throws Exception {
        renderText("REZERWACJA NUMERÓW");
    }

    // public static void getCustomReport(Boolean attributeLegend, String lineBreak, String fileFormat, CustomReportAttribute[] attributeList) throws Exception {
    //    renderText("RAPORT DOWOLNY");
    // }

    public static void getDifferenceReport(String reportType, Boolean attribute, Boolean registerUnit, Boolean share, Boolean lot, Boolean building, Boolean local) throws Exception {
        renderText("RAPORT RÓŻNIC");
    }

    public static void getScan(String objectType, String objectName) throws Exception {
        renderText("SKAN");
    }

}