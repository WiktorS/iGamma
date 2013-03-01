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
