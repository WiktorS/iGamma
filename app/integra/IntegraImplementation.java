package integra;

import com.google.gson.JsonElement;
import integra.models.IntegraModel;
import integra.models.RegisterUnit;
import play.Play;
import play.libs.WS;

import java.util.ArrayList;
import java.util.List;

public class IntegraImplementation implements Integra {

    private static final String integraUrl = Play.configuration.getProperty("integra.url");
    private static final String timeout = "10s";

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

    private <T extends IntegraModel> List<T> listFromJson(JsonElement jsonResult, Class<T> integraModelClass) {
        List<T> result = new ArrayList<T>();
        if (jsonResult != null)
            if (jsonResult.isJsonArray()) {
                for (JsonElement jsonElement: jsonResult.getAsJsonArray()) {
                    T resultElement = objectFromJson(jsonElement, integraModelClass);
                    if (resultElement != null) {
                        result.add(resultElement);
                    }
                }
            }
            else {
                T resultElement = objectFromJson(jsonResult, integraModelClass);
                if (resultElement != null) {
                    result.add(resultElement);
                }
            }
        return result;
    }

    private <T extends IntegraModel> T objectFromJson(JsonElement jsonElement, Class<T> integraModelClass) {
        T resultElement = null;
        try {
            if (jsonElement.isJsonObject())
            {
                resultElement = integraModelClass.newInstance();
                resultElement.fromJson(jsonElement.getAsJsonObject());
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return resultElement;
    }

    @Override
    public List<RegisterUnit> getRegisterUnits() {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnits");
        return listFromJson(jsonResult, RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnitsByJrb");
        return listFromJson(jsonResult, RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        JsonElement jsonResult = invokeMethodJson("getRegisterUnitsByJrg");
        return listFromJson(jsonResult, RegisterUnit.class);
    }
}
