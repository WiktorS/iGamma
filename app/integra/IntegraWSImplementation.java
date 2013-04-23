package integra;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import integra.models.*;
import play.Play;
import play.libs.WS;

import java.io.File;
import java.lang.reflect.Modifier;
import java.util.List;

public class IntegraWSImplementation implements Integra{

    private static final String integraUrl = Play.configuration.getProperty("integra.url");
    private static final String timeout = "10s";
    private static final Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.PRIVATE).create();

    private String getMethodUrl(String getRegisterUnits) {
        return integraUrl + "/" + getRegisterUnits + ".json";
    }

    private JsonElement invokeMethodJson(String method) {
        JsonElement result = null;
        WS.HttpResponse response = WS.url(getMethodUrl(method)).timeout(timeout).get();
        if (response.success()) {
            result = response.getJson();
        }
        return result;
    }

    @Override
    public List<Building> getBuildings(long idList[]) {
        JsonElement jsonResult = invokeMethodJson("getBuildings");
        TypeToken<List<Building>> typeToken = new TypeToken<List<Building>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Document> getDocuments(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Group> getGroups(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Person> getPersons(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Institution> getInstitutions(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrg(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrb(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrl(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getOldJrg(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<LandCommunity> getLandCommunities(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Local> getLocals(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Lot> getLots(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Address> getAddresses(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Share> getShares(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Change> getChanges(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Systematic> getSystematics(long[] parentIdList) {
        return null;  //TODO
    }

    @Override
    public List<CadastralUnit> getCadastralUnits() throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Precinct> getPrecincts(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Clause> getPrintClauses(String printType) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public CustomReportData getCustomReportData(String objectType) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public CustomReportData removeCustomReportConfig(String[] configList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public CustomReportData saveCustomReportConfig(CustomReportConfiguration config) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printExtracts(String extractType, String sort, String number, boolean shareInfo, boolean noPersonalData, boolean noPESEL, boolean chosenShares, boolean otherCadastralUnitForPersons, boolean accounted, boolean noPendingChanges, boolean eachLotIndependent, boolean lotNotes, boolean chosenLots, boolean includeClauses, String state, String stateDay, boolean extractAndSketch, boolean simpleExtractForNeighboringLots, boolean buildingIndexExtract, boolean localIndexExtract, String localIndex, boolean extractNote, String extractNoteText, boolean lotAddresses, boolean terrainCategories, boolean eachBuidingIndependent, boolean buildingNotes, boolean chosenBuildings, boolean eachLocalIndependent, boolean localNotes, boolean chosenLocals, String fileFormat, Clause[] clauses, IntegraModel[] lots, IntegraModel[] buildings, IntegraModel[] locals, IntegraModel[] shares) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printLotIndex(String state, String stateDay, IntegraModel[] precincts) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printEntityIndexes(String state, String stateDay, boolean alphabeticalTable, boolean onlyManagingGovernmentLand, IntegraModel[] precincts) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printRankings(String scope, String area, String decimals, boolean saveSheet, String state, String stateDay, IntegraModel[] precincts) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printChangeNotification(String number, boolean printChanges, boolean shareInfo, String shareType, boolean onlyShares, boolean noPESEL, boolean noNIP, boolean infoHeader, String dataType, boolean shareSummary, boolean buildingIndex, String buildingIndexType, boolean localIndex, String localIndexType, IntegraModel[] chosenRegisterUnits, boolean frontPage, boolean onlyChosen, boolean entities, boolean lots, boolean buildings, boolean locals, boolean landPossesing, String personType, IntegraEntity[] recipients, IntegraEntity[] receivers, IntegraModel[] changeRegisterUnits) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printChangesApplicationReport(boolean changeRegistered, boolean changeAccepted, boolean changeCanceled, boolean changeDenied, boolean printRegisterUnitList, String precinct, String filterDate, String filterDateFrom, String filterDateTo, String sort, String report, String description, IntegraModel[] precincts) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public File printCustomReport(CustomReportAttribute[] attributes, boolean attributeLegend, long lineBreak, String fileFormat) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
//
//    @Override
//    public List<ShareSummary> getShareSummary() {
//        return null;  //TODO
//    }
//
//    @Override
//    public CustomReportData getCustomReportData(String type, String name) {
//        return null;  //TODO
//    }
//
//    @Override
//    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) {
//        return null;  //TODO
//    }

    @Override
    public List<Long> findObjects(String queryName, QueryEntry[] queryEntryList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
