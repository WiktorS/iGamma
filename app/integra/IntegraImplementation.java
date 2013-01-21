package integra;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import integra.models.*;
import play.Play;
import play.libs.WS;

import java.lang.reflect.Modifier;
import java.util.List;

public class IntegraImplementation implements Integra{

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
    public List<RegisterUnit> getRegisterUnits(String type) {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnits");
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Lot> getLotsByNumber(String number) {
        JsonElement jsonResult = invokeMethodJson("getLotsByNumber");
        TypeToken<List<Lot>> typeToken = new TypeToken<List<Lot>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Building> getBuildings(List<QueryEntry> queryEntryList) {
        JsonElement jsonResult = invokeMethodJson("getBuildings");
        TypeToken<List<Building>> typeToken = new TypeToken<List<Building>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Local> getLocalByNumber(String numberL) {
        JsonElement jsonResult = invokeMethodJson("getLocalByNumber");
        TypeToken<List<Local>> typeToken = new TypeToken<List<Local>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Person> getPersonByPesel(String pesel) {
        JsonElement jsonResult = invokeMethodJson("getPersonByPesel");
        TypeToken<List<Person>> typeToken = new TypeToken<List<Person>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Institution> getInstitutionByNip(String nip) {
        JsonElement jsonResult = invokeMethodJson("getInstitutionByNip");
        TypeToken<List<Institution>> typeToken = new TypeToken<List<Institution>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<Group> getGroupByNip(String nip) {
        JsonElement jsonResult = invokeMethodJson("getGroupByNip");
        TypeToken<List<Group>> typeToken = new TypeToken<List<Group>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<LandCommunity> getLandCommunities(String name) {
        JsonElement jsonResult = invokeMethodJson("getLandCommunities");
        TypeToken<List<LandCommunity>> typeToken = new TypeToken<List<LandCommunity>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public EgbilObject getEgbilObject(String type, String name) {
        JsonElement jsonResult = invokeMethodJson("getEgbilObject");
        TypeToken<EgbilObject> typeToken = new TypeToken<EgbilObject>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<EgbilDocument> getDocuments() {
        return null;  //TODO
    }

    @Override
    public List<Systematic> getSystematics(long[] parentIdList) {
        return null;  //TODO
    }

    @Override
    public List<ShareSummary> getShareSummary() {
        return null;  //TODO
    }

    @Override
    public CustomReportData getCustomReportData(String type, String name) {
        return null;  //TODO
    }

    @Override
    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) {
        return null;  //TODO
    }
}
