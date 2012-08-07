package integra;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import integra.models.IntegraModel;
import integra.models.RegisterUnit;
import models.RegisterUnitMock;

import java.util.ArrayList;
import java.util.List;

public class IntegraMock implements Integra {

    private static Gson gson = new Gson();

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
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.findAll();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrb = ?", jrb).fetch();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrg = ?", jrg).fetch();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }
}
