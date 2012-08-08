package integra;

import com.google.gson.JsonElement;
import integra.models.IntegraModel;

import java.util.ArrayList;
import java.util.List;

public class IntegraCommon {

    protected <T extends IntegraModel> List<T> listFromJson(JsonElement jsonResult, Class<T> integraModelClass) {
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

    protected <T extends IntegraModel> T objectFromJson(JsonElement jsonElement, Class<T> integraModelClass) {
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
}
