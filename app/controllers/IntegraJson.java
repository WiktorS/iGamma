package controllers;

import integra.Integra;
import integra.IntegraServer;
import integra.models.*;
import play.mvc.Controller;

import java.io.File;
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

    public static void getCadastralUnits() throws Exception {
        List<CadastralUnit> result = integra.getCadastralUnits();
        renderJSON(result);
    }

    public static void getPrecincts(long[] idList) throws Exception {
        List<Precinct> result = integra.getPrecincts(idList);
        renderJSON(result);
    }




    public static void getPrintClauses(String printType) throws Exception {
        List<Clause> result = integra.getPrintClauses(printType);
        renderJSON(result);
    }

//    public static void getShareSummary() throws Exception {
//       List<ShareSummary> result = integra.getShareSummary();
//       renderJSON(result);
//    }
//
    public static void getCustomReportData(String objectType) throws Exception {
       CustomReportData result = integra.getCustomReportData(objectType);
       renderJSON(result);
    }

    public static void removeCustomReportConfig(String[] configList) throws Exception {
        CustomReportData result = integra.removeCustomReportConfig(configList);
        renderJSON(result);
    }

    public static void saveCustomReportConfig(CustomReportConfiguration config) throws Exception {
        CustomReportData result = integra.saveCustomReportConfig(config);
        renderJSON(result);
    }

    public static void printExtracts(String extractType, String sort, String number, boolean  shareInfo, boolean noPersonalData,
                                     boolean noPESEL, boolean chosenShares, boolean otherCadastralUnitForPersons, boolean accounted,
                                     boolean noPendingChanges, boolean eachLotIndependent, boolean lotNotes, boolean chosenLots,
                                     boolean includeClauses, String state, String stateDay, boolean extractAndSketch,
                                     boolean simpleExtractForNeighboringLots, boolean buildingIndexExtract,
                                     boolean localIndexExtract, String localIndex, boolean extractNote, String extractNoteText,
                                     boolean lotAddresses, boolean terrainCategories, boolean eachBuidingIndependent,
                                     boolean buildingNotes, boolean chosenBuildings, boolean eachLocalIndependent,
                                     boolean localNotes, boolean chosenLocals, String fileFormat, Clause[] clauses,
                                     IntegraModel[] lots, IntegraModel[] buildings, IntegraModel[] locals, IntegraModel[] shares) throws Exception {
        File file = integra.printExtracts(extractType, sort, number, shareInfo, noPersonalData, noPESEL, chosenShares, otherCadastralUnitForPersons,
                accounted, noPendingChanges, eachLotIndependent, lotNotes, chosenLots, includeClauses, state, stateDay,
                extractAndSketch, simpleExtractForNeighboringLots, buildingIndexExtract, localIndexExtract, localIndex,
                extractNote, extractNoteText, lotAddresses, terrainCategories, eachBuidingIndependent, buildingNotes,
                chosenBuildings, eachLocalIndependent, localNotes, chosenLocals, fileFormat, clauses, lots, buildings,
                locals, shares);
        renderBinary(file);
    }

    public static void printLotIndex(String state, String stateDay, IntegraModel[] precincts) throws Exception {
        File file = integra.printLotIndex(state, stateDay, precincts);
        renderBinary(file);
    }

    public static void printEntityIndexes(String state, String stateDay, boolean alphabeticalTable, boolean onlyManagingGovernmentLand,
                                          IntegraModel[] precincts) throws Exception {
        File file = integra.printEntityIndexes(state, stateDay, alphabeticalTable, onlyManagingGovernmentLand, precincts);
        renderBinary(file);
    }

    public static void printRankings(String scope, String area, String decimals, boolean saveSheet, String state, String stateDay,
                                    IntegraModel[] precincts, File sheetModel, File exportFile) throws Exception {
        File file = integra.printRankings(scope, area, decimals, saveSheet, state, stateDay, precincts);
        renderBinary(file);
    }

    public static void printChangeNotification(String number, boolean printChanges, boolean shareInfo, String shareType,
                                               boolean onlyShares, boolean noPESEL, boolean noNIP, boolean infoHeader,
                                               String dataType, boolean shareSummary, boolean buildingIndex, String buildingIndexType,
                                               boolean localIndex, String localIndexType, IntegraModel[] chosenRegisterUnits,
                                               boolean frontPage, boolean onlyChosen, boolean entities, boolean lots,
                                               boolean buildings, boolean locals, boolean landPossesing, String personType,
                                               IntegraEntity[] recipients, IntegraEntity[] receivers, IntegraModel[] changeRegisterUnits) throws Exception {
        File file = integra.printChangeNotification(number, printChanges, shareInfo, shareType, onlyShares, noPESEL, noNIP,
                infoHeader, dataType, shareSummary, buildingIndex, buildingIndexType, localIndex, localIndexType, chosenRegisterUnits,
                frontPage, onlyChosen, entities, lots, buildings, locals, landPossesing, personType, recipients, receivers, changeRegisterUnits);
        renderBinary(file);
    }

    public static void printChangesApplicationReport(boolean changeRegistered, boolean changeAccepted, boolean changeCanceled,
                                                     boolean changeDenied, boolean printRegisterUnitList, String precinct,
                                                     String filterDate, String filterDateFrom, String filterDateTo,
                                                     String sort, String report, String description, IntegraModel[] precincts) throws Exception {
        File file = integra.printChangesApplicationReport(changeRegistered, changeAccepted, changeCanceled, changeDenied,
                printRegisterUnitList, precinct, filterDate, filterDateFrom, filterDateTo, sort, report, description, precincts);
        renderBinary(file);
    }

    public static void printCustomReport(CustomReportAttribute[] attributes, boolean attributeLegend, long lineBreak, String fileFormat) throws Exception {
        File file = integra.printCustomReport(attributes, attributeLegend, lineBreak, fileFormat);
        renderBinary(file);
    }



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