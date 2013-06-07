package integra;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import integra.models.*;
import play.Logger;
import play.Play;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.*;

public class IntegraMockImplementation implements Integra {

    private static final Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.PRIVATE).create();

    private void mockIntegrityChecker(Type type, Reader json) throws Exception{
        checkElement(new JsonParser().parse(json), type, "");
    }

    private void checkElement(JsonElement jsonElement, Type type, String parent) throws Exception {
        if (jsonElement.isJsonArray()) {
            checkArray(jsonElement.getAsJsonArray(), type, parent);
        }
        else if (jsonElement.isJsonObject()) {
            checkObject(jsonElement.getAsJsonObject(), type, parent);
        }
//        else if  (jsonElement.isJsonPrimitive()) {
//            checkPrimitive(jsonElement.getAsJsonPrimitive(), type, parent);
//        }
    }

    private void checkObject(JsonObject jsonObject, Type type, String parent) throws Exception {
        for (Map.Entry<String, JsonElement> stringJsonElementEntry : jsonObject.entrySet()) {
            String fieldName = stringJsonElementEntry.getKey();
            Field field;
            try{
                field =((Class)type).getField(fieldName);
            }
            catch (NoSuchFieldException e) {
                throw new Exception("Field '"+fieldName+"' is defined in JSON '"+parent+"' but not in Java class '"+((Class) type).getName()+"'");
            }
            checkElement(stringJsonElementEntry.getValue(), field.getGenericType(), parent + "/" + fieldName);
        }
        for (Field field : ((Class) type).getFields()) {
            String fieldName = field.getName();
            if (jsonObject.get(fieldName) == null)
                throw new Exception("Field '"+fieldName+"' is defined in Java class '"+((Class) type).getName()+"' but not in JSON '"+parent+"'");
        }

    }

    private void checkArray(JsonArray jsonArray, Type type, String parent) throws Exception {
        ParameterizedType parametrisedType = (ParameterizedType)type;
        int i=0;
        for (JsonElement arrayElement : jsonArray) {
            Type[] actualTypeArguments = parametrisedType.getActualTypeArguments();
            checkElement(arrayElement, actualTypeArguments[0], parent + "["+String.valueOf(i)+"]");
            i++;
        }
    }

//    private void checkPrimitive(JsonPrimitive jsonPrimitive, Type type, String parent) throws Exception {
//        //TODO: Check primitive types?
//    }

    private <T> T getMockJsonData(String methodName, TypeToken<T> typeToken, String... params) throws Exception{
        T result;
        File mockFile = getMockFile(methodName, params);
        {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(mockFile));
            //Test if JSON and Type fields are matching
            mockIntegrityChecker(typeToken.getType(), bufferedReader);
            bufferedReader.close();
        }
        {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(mockFile));
            result = gson.fromJson(bufferedReader, typeToken.getType());
            bufferedReader.close();
        }
        return result;
    }

    private File getMockFile(String methodName, String...params) {
        Deque<String> paramsDeque = prepareParamsDeque(params);
        return findMockFileByParams(methodName, paramsDeque);
    }

    private Deque<String> prepareParamsDeque(String...params) {
        List<String> paramList = new ArrayList<String>();
        for (String param: params) {
            paramList.add(param != null ? param : "null");
        }
        Deque<String> paramsDeque = new ArrayDeque<String>(paramList);
        return paramsDeque;
    }

    private File findMockFileByParams(String methodName, Deque<String> paramsDeque) {
        File result;
        boolean exitLoop = false;
        do {
            String fileName = methodName;
            for (String param : paramsDeque) {
                fileName += "_" + param;
            }
            if (!paramsDeque.isEmpty()) {
                paramsDeque.removeLast();
            }
            else {
                exitLoop = true;
            }
            result = Play.getFile("mock/" + fileName + ".json");
            Logger.debug("Trying to load mock '%s'", fileName);
        } while (!exitLoop && !result.exists());
        return result;
    }

    private String queryEntryListToString(QueryEntry[] queryEntryList) {
        if (queryEntryList != null)
        {
            StringBuilder sb = new StringBuilder();
            String loopDelim = "";
            //Sort by params by name to preserve order
            Arrays.sort(queryEntryList, new Comparator<QueryEntry>() {
                @Override
                public int compare(QueryEntry o1, QueryEntry o2) {
                    return o1.name.compareTo(o2.name);
                }
            });
            for (QueryEntry entry : queryEntryList){
                if (entry != null)
                {
                    sb.append(loopDelim);
                    sb.append(entry.name + "=" + entry.value);
                    loopDelim = "_";
                }
            }
            return sb.toString();
        }
        return null;
    }

    private void checkIdListArgument(long idList[]) throws Exception {
        if (idList == null)
            throw new Exception("List is null");
        else if (idList.length == 0)
            throw new Exception("List is empty");
        else { //if (idList != null) {
            for (long item: idList) {
                if (item < 0)
                    throw new Exception("Wrong identifier");
            }
        }
    }


    @Override
    public List<Building> getBuildings(long idList[]) throws Exception {
        TypeToken<List<Building>> typeToken = new TypeToken<List<Building>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getBuildings", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Document> getDocuments(long[] idList) throws Exception {
        TypeToken<List<Document>> typeToken = new TypeToken<List<Document>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getDocuments", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Group> getGroups(long[] idList) throws Exception {
        TypeToken<List<Group>> typeToken = new TypeToken<List<Group>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getGroups", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Person> getPersons(long[] idList) throws Exception {
        TypeToken<List<Person>> typeToken = new TypeToken<List<Person>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getPersons", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Institution> getInstitutions(long[] idList) throws Exception {
        TypeToken<List<Institution>> typeToken = new TypeToken<List<Institution>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getInstitutions", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<RegisterUnit> getJrg(long[] idList) throws Exception {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getJrg", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<RegisterUnit> getJrb(long[] idList) throws Exception {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getJrb", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<RegisterUnit> getJrl(long[] idList) throws Exception {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getJrl", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<RegisterUnit> getOldJrg(long[] idList) throws Exception {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getOldJrg", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<LandCommunity> getLandCommunities(long[] idList) throws Exception {
        TypeToken<List<LandCommunity>> typeToken = new TypeToken<List<LandCommunity>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getLandCommunities", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Local> getLocals(long[] idList) throws Exception {
        TypeToken<List<Local>> typeToken = new TypeToken<List<Local>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getLocals", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Lot> getLots(long[] idList) throws Exception {
        TypeToken<List<Lot>> typeToken = new TypeToken<List<Lot>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getLots", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Address> getAddresses(long[] idList) throws Exception {
        TypeToken<List<Address>> typeToken = new TypeToken<List<Address>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getAddresses", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Share> getShares(long[] idList) throws Exception {
        TypeToken<List<Share>> typeToken = new TypeToken<List<Share>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getShares", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Change> getChanges(long[] idList) throws Exception {
        TypeToken<List<Change>> typeToken = new TypeToken<List<Change>>() {};
        checkIdListArgument(idList);
        Arrays.sort(idList);
        return getMockJsonData("getChanges", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Systematic> getSystematics(long[] parentIdList) throws Exception {
        TypeToken<List<Systematic>> typeToken = new TypeToken<List<Systematic>>() {};
        return getMockJsonData("getSystematics", typeToken, Arrays.toString(parentIdList));
    }

    @Override
    public List<CadastralUnit> getCadastralUnits() throws Exception {
        TypeToken<List<CadastralUnit>> typeToken = new TypeToken<List<CadastralUnit>>() {};
        return getMockJsonData("getCadastralUnits", typeToken);
    }

    @Override
    public List<Precinct> getPrecincts(long[] idList) throws Exception {
        TypeToken<List<Precinct>> typeToken = new TypeToken<List<Precinct>>() {};
        return getMockJsonData("getPrecincts", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Clause> getPrintClauses(String printType) throws Exception {
        TypeToken<List<Clause>> typeToken = new TypeToken<List<Clause>>() {};
        return getMockJsonData("getPrintClauses", typeToken, printType);
    }

    @Override
    public CustomReportData getCustomReportData(String objectType) throws Exception {
        TypeToken<CustomReportData> typeToken = new TypeToken<CustomReportData>() {};
        return getMockJsonData("getCustomReportData", typeToken, objectType);
    }

    @Override
    public CustomReportData removeCustomReportConfig(String[] configList) throws Exception {
        TypeToken<CustomReportData> typeToken = new TypeToken<CustomReportData>() {};
        return getMockJsonData("removeCustomReportData", typeToken);
    }

    @Override
    public CustomReportData saveCustomReportConfig(CustomReportConfiguration config) throws Exception {
        TypeToken<CustomReportData> typeToken = new TypeToken<CustomReportData>() {};
        return getMockJsonData("saveCustomReportData", typeToken);
    }

    @Override
    public File printExtracts(String extractType, String sort, String number, boolean shareInfo, boolean noPersonalData, boolean noPESEL,
                              boolean chosenShares, boolean otherCadastralUnitForPersons, boolean accounted, boolean noPendingChanges,
                              boolean eachLotIndependent, boolean lotNotes, boolean chosenLots, boolean includeClauses,
                              String state, String stateDay, boolean extractAndSketch, boolean simpleExtractForNeighboringLots,
                              boolean buildingIndexExtract, boolean localIndexExtract, String localIndex, boolean extractNote,
                              String extractNoteText, boolean lotAddresses, boolean terrainCategories, boolean eachBuidingIndependent,
                              boolean buildingNotes, boolean chosenBuildings, boolean eachLocalIndependent, boolean localNotes,
                              boolean chosenLocals, String fileFormat, Clause[] clauses, IntegraModel[] lots, IntegraModel[] buildings,
                              IntegraModel[] locals, IntegraModel[] shares) {
        return Play.getFile("mock/printExtracts.pdf");
    }

    @Override
    public File printLotIndex(String state, String stateDay, IntegraModel[] precincts) {
        return Play.getFile("mock/printLotIndex.pdf");
    }

    @Override
    public File printEntityIndexes(String state, String stateDay, boolean alphabeticalTable, boolean onlyManagingGovernmentLand, IntegraModel[] precincts) {
        return Play.getFile("mock/printEntityIndexes.pdf");
    }

    @Override
    public File printRankings(String scope, String area, String decimals, boolean saveSheet, String state, String stateDay, IntegraModel[] precincts) {
        return Play.getFile("mock/printRankings.pdf");
    }

    @Override
    public File printChangeNotification(String number, boolean printChanges, boolean shareInfo, String shareType, boolean onlyShares,
                                        boolean noPESEL, boolean noNIP, boolean infoHeader, String dataType, boolean shareSummary,
                                        boolean buildingIndex, String buildingIndexType, boolean localIndex, String localIndexType,
                                        IntegraModel[] chosenRegisterUnits, boolean frontPage, boolean onlyChosen, boolean entities,
                                        boolean lots, boolean buildings, boolean locals, boolean landPossesing, String personType,
                                        IntegraEntity[] recipients, IntegraEntity[] receivers, IntegraModel[] changeRegisterUnits) {
        return Play.getFile("mock/printChangeNotification.pdf");
    }

    @Override
    public File printChangesApplicationReport(boolean changeRegistered, boolean changeAccepted, boolean changeCanceled,
                                              boolean changeDenied, boolean printRegisterUnitList, String precinct, String filterDate,
                                              String filterDateFrom, String filterDateTo, String sort, String report, String description,
                                              IntegraModel[] precincts) {
        return Play.getFile("mock/printChangesApplicationReport.pdf");
    }

    @Override
    public File printCustomReport(CustomReportAttribute[] attributes, boolean attributeLegend, long lineBreak, String fileFormat) {
        return Play.getFile("mock/printCustomReport.pdf");
    }
//
//    @Override
//    public List<ShareSummary> getShareSummary() throws Exception {
//        TypeToken<List<ShareSummary>> typeToken = new TypeToken<List<ShareSummary>>() {};
//        return getMockJsonData("getShareSummary", typeToken);
//    }
//
//    @Override
//    public CustomReportData getCustomReportData(String type, String name) throws Exception {
//        TypeToken<CustomReportData> typeToken = new TypeToken<CustomReportData>() {};
//        return getMockJsonData("getCustomReportData", typeToken, type, name);
//    }
//
//    @Override
//    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception {
//        TypeToken<List<EgbilObjectData>> typeToken = new TypeToken<List<EgbilObjectData>>() {};
//        return getMockJsonData("getRelatedObjects", typeToken, relation, objectList.toString());
//    }

    @Override
    public List<Long> findObjects(String queryName, QueryEntry[] queryEntryList) throws Exception {
        TypeToken<List<Long>> typeToken = new TypeToken<List<Long>>() {};
        if (queryEntryList == null)
            throw new Exception("queryEntryList is null");
        if (queryEntryList.length == 0)
            throw new Exception("queryEntryList is empty");
        return getMockJsonData("findObjects", typeToken, queryName, queryEntryListToString(queryEntryList));
    }
}
