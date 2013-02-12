package integra;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import integra.models.*;
import play.Logger;
import play.Play;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.*;

public class IntegraMock implements Integra {

    private static final Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.PRIVATE).create();

    private void mockIntegrityChecker(Type type, Reader json) throws Exception{
        checkElement(new JsonParser().parse(json), type);
    }

    private void checkElement(JsonElement jsonElement, Type type) throws Exception {
        if (jsonElement.isJsonArray()) {
            checkArray(jsonElement.getAsJsonArray(), type);
        }
        else if (jsonElement.isJsonObject()) {
            checkObject(jsonElement.getAsJsonObject(), type);
        }
        else if  (jsonElement.isJsonPrimitive()) {
            checkPrimitive(jsonElement.getAsJsonPrimitive(), type);
        }
    }

    private void checkObject(JsonObject jsonObject, Type type) throws Exception {
        for (Map.Entry<String, JsonElement> stringJsonElementEntry : jsonObject.entrySet()) {
            String fieldName = stringJsonElementEntry.getKey();
            Field field;
            try{
                field =((Class)type).getField(fieldName);
            }
            catch (NoSuchFieldException e) {
                throw new Exception("Java class '"+((Class) type).getName()+"' is missing field: '"+fieldName+"'");
            }
            checkElement(stringJsonElementEntry.getValue(), field.getGenericType());
        }
        for (Field field : ((Class) type).getFields()) {
            String fieldName = field.getName();
            if (jsonObject.get(fieldName) == null)
                throw new Exception("JSON object has field '"+fieldName+"' which is not defined in class '"+((Class) type).getName()+"'");
        }

    }

    private void checkArray(JsonArray jsonArray, Type type) throws Exception {
        ParameterizedType parametrisedType = (ParameterizedType)type;
        for (JsonElement arrayElement : jsonArray) {
            Type[] actualTypeArguments = parametrisedType.getActualTypeArguments();
            checkElement(arrayElement, actualTypeArguments[0]);
        }
    }

    private void checkPrimitive(JsonPrimitive jsonPrimitive, Type type) throws Exception {
        //TODO: Check primitive types?
    }

    private <T> T getMockJsonData(String methodName, TypeToken<T> typeToken, String... params) throws Exception{
        T result = null;
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


    @Override
    public List<RegisterUnit> getRegisterUnits(String type) throws Exception {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnits", typeToken, type);
    }

    @Override
    public List<Lot> getLotsByNumber(String number) throws Exception {
        TypeToken<List<Lot>> typeToken = new TypeToken<List<Lot>>() {};
        return getMockJsonData("getLotsByNumber", typeToken, number);
    }

    @Override
    public List<Building> getBuildings(long idList[]) throws Exception {
        TypeToken<List<Building>> typeToken = new TypeToken<List<Building>>() {};
        if (idList == null)
            throw new Exception("List is null");
        if (idList.length == 0)
            throw new Exception("List is empty");
        if (idList != null) {
            for (long item: idList) {
                if (item < 0)
                    throw new Exception("Wrong identifier");
            }
        }
        Arrays.sort(idList);
        return getMockJsonData("getBuildings", typeToken, Arrays.toString(idList));
    }

    @Override
    public List<Local> getLocalByNumber(String numberL) throws Exception {
        TypeToken<List<Local>> typeToken = new TypeToken<List<Local>>() {};
        return getMockJsonData("getLocalByNumber", typeToken, numberL);
    }

    @Override
    public List<Person> getPersonByPesel(String pesel) throws Exception {
        TypeToken<List<Person>> typeToken = new TypeToken<List<Person>>() {};
        return getMockJsonData("getPersonByPesel", typeToken, pesel);
    }

    @Override
    public List<Institution> getInstitutionByNip(String nip) throws Exception {
        TypeToken<List<Institution>> typeToken = new TypeToken<List<Institution>>() {};
        return getMockJsonData("getInstitutionByNip", typeToken, nip);
    }

    @Override
    public List<Group> getGroupByNip(String nip) throws Exception {
        TypeToken<List<Group>> typeToken = new TypeToken<List<Group>>() {};
        return getMockJsonData("getGroupByNip", typeToken, nip);
    }

    @Override
    public List<LandCommunity> getLandCommunities(String name) throws Exception {
        TypeToken<List<LandCommunity>> typeToken = new TypeToken<List<LandCommunity>>() {};
        return getMockJsonData("getLandCommunities", typeToken, name);
    }

    @Override
    public EgbilObject getEgbilObject(String type, String name) throws Exception {
        TypeToken<EgbilObject> typeToken = new TypeToken<EgbilObject>() {};
        return getMockJsonData("getEgbilObject", typeToken, type, name);
    }

    @Override
    public List<EgbilDocument> getDocuments() throws Exception {
        TypeToken<List<EgbilDocument>> typeToken = new TypeToken<List<EgbilDocument>>() {};
        return getMockJsonData("getDocuments", typeToken);
    }

    @Override
    public List<Systematic> getSystematics(long[] parentIdList) throws Exception {
        TypeToken<List<Systematic>> typeToken = new TypeToken<List<Systematic>>() {};
        return getMockJsonData("getSystematics", typeToken, Arrays.toString(parentIdList));
    }

    @Override
    public List<ShareSummary> getShareSummary() throws Exception {
        TypeToken<List<ShareSummary>> typeToken = new TypeToken<List<ShareSummary>>() {};
        return getMockJsonData("getShareSummary", typeToken);
    }

    @Override
    public CustomReportData getCustomReportData(String type, String name) throws Exception {
        TypeToken<CustomReportData> typeToken = new TypeToken<CustomReportData>() {};
        return getMockJsonData("getCustomReportData", typeToken, type, name);
    }

    @Override
    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception {
        TypeToken<List<EgbilObjectData>> typeToken = new TypeToken<List<EgbilObjectData>>() {};
        return getMockJsonData("getRelatedObjects", typeToken, relation, objectList.toString());
    }

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
