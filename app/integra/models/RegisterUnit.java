package integra.models;

import com.google.gson.JsonObject;

public class RegisterUnit implements IntegraModel {
    public String jrg;
    public String jrb;

    @Override
    public void fromJson(JsonObject jsonObject) {
        jrb = jsonObject.get("jrb").getAsString();
        jrg = jsonObject.get("jrg").getAsString();
    }

    @Override
    public JsonObject toJson() {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("jrb", jrb);
        jsonObject.addProperty("jrg", jrg);
        return jsonObject;
    }
}
