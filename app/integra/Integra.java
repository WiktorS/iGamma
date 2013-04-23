package integra;

import integra.models.*;

import java.io.File;
import java.util.List;

public interface Integra {
    List<Long> findObjects(String queryName, QueryEntry[] queryArgs) throws Exception;

    List<Building> getBuildings(long idList[]) throws Exception;
    List<Document> getDocuments(long idList[]) throws Exception;
    List<Group> getGroups(long idList[]) throws Exception;
    List<Person> getPersons(long idList[]) throws Exception;
    List<Institution> getInstitutions(long idList[]) throws Exception;
    List<RegisterUnit> getJrg(long idList[]) throws Exception;
    List<RegisterUnit> getJrb(long idList[]) throws Exception;
    List<RegisterUnit> getJrl(long idList[]) throws Exception;
    List<RegisterUnit> getOldJrg(long idList[]) throws Exception;
    List<LandCommunity> getLandCommunities(long idList[]) throws Exception;
    List<Local> getLocals(long idList[]) throws Exception;
    List<Lot> getLots(long idList[]) throws Exception;
    List<Address> getAddresses(long idList[]) throws Exception;
    List<Share> getShares(long[] idList) throws Exception;
    List<Change> getChanges(long[] idList) throws Exception;

    List<Systematic> getSystematics(long[] parentIdList) throws Exception;
    List<CadastralUnit> getCadastralUnits() throws Exception;
    List<Precinct> getPrecincts(long[] idList) throws Exception;

    List<Clause> getPrintClauses(String printType) throws Exception;
    CustomReportData getCustomReportData(String objectType)throws Exception;
    CustomReportData removeCustomReportConfig(String[] configList) throws Exception;
    CustomReportData saveCustomReportConfig(CustomReportConfiguration config) throws Exception;

    File printExtracts(String extractType, String sort, String number, boolean shareInfo, boolean noPersonalData, boolean noPESEL, boolean chosenShares, boolean otherCadastralUnitForPersons, boolean accounted, boolean noPendingChanges, boolean eachLotIndependent, boolean lotNotes, boolean chosenLots, boolean includeClauses, String state, String stateDay, boolean extractAndSketch, boolean simpleExtractForNeighboringLots, boolean buildingIndexExtract, boolean localIndexExtract, String localIndex, boolean extractNote, String extractNoteText, boolean lotAddresses, boolean terrainCategories, boolean eachBuidingIndependent, boolean buildingNotes, boolean chosenBuildings, boolean eachLocalIndependent, boolean localNotes, boolean chosenLocals, String fileFormat, Clause[] clauses, IntegraModel[] lots, IntegraModel[] buildings, IntegraModel[] locals, IntegraModel[] shares);
    File printLotIndex(String state, String stateDay, IntegraModel[] precincts);
    File printEntityIndexes(String state, String stateDay, boolean alphabeticalTable, boolean onlyManagingGovernmentLand, IntegraModel[] precincts);
    File printRankings(String scope, String area, String decimals, boolean saveSheet, String state, String stateDay, IntegraModel[] precincts);
    File printChangeNotification(String number, boolean printChanges, boolean shareInfo, String shareType, boolean onlyShares, boolean noPESEL, boolean noNIP, boolean infoHeader, String dataType, boolean shareSummary, boolean buildingIndex, String buildingIndexType, boolean localIndex, String localIndexType, IntegraModel[] chosenRegisterUnits, boolean frontPage, boolean onlyChosen, boolean entities, boolean lots, boolean buildings, boolean locals, boolean landPossesing, String personType, IntegraEntity[] recipients, IntegraEntity[] receivers, IntegraModel[] changeRegisterUnits);
    File printChangesApplicationReport(boolean changeRegistered, boolean changeAccepted, boolean changeCanceled, boolean changeDenied, boolean printRegisterUnitList, String precinct, String filterDate, String filterDateFrom, String filterDateTo, String sort, String report, String description, IntegraModel[] precincts);
    File printCustomReport(CustomReportAttribute[] attributes, boolean attributeLegend, long lineBreak, String fileFormat);


//    List<ShareSummary> getShareSummary() throws Exception;
//    CustomReportData getCustomReportData(String type, String name) throws Exception;
//    List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception;
}
