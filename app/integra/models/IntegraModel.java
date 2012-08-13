package integra.models;

import com.google.gson.JsonObject;

public interface IntegraModel {
    void fromJson(JsonObject jsonObject);
    JsonObject toJson();
}
