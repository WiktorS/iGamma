package integra;

import com.google.gson.JsonElement;
import integra.models.RegisterUnit;
import play.Play;
import play.libs.WS;

import java.util.List;

public class IntegraImplementation extends IntegraCommon implements Integra{

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
