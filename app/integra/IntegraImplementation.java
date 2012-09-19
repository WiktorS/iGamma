package integra;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import integra.models.EgbilDocument;
import integra.models.EgbilObject;
import integra.models.RegisterUnit;
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
    public List<RegisterUnit> getRegisterUnits() {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnits");
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrgib(String jrgib) {
        return null;  //TODO
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnitsByJrb");
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return gson.fromJson(jsonResult, typeToken.getType());
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrl(String jrl) {
        return null;  //TODO
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnitsByJrg");
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
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
}
