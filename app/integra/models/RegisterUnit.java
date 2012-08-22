package integra.models;

import com.google.gson.JsonObject;

public class RegisterUnit implements IntegraModel {
    public String marker;
    public String jrgNumber;
    public String jrbNumber;
    public String jrlNumber;
    public String precinct;
    public String cadastralUnit;
    public String creationProof;
    public String creationDate;
    public String regon;

    @Override
    public void fromJson(JsonObject jsonObject) {
        marker = jsonObject.get("marker").getAsString();
        jrgNumber = jsonObject.get("jrgNumber").getAsString();
        jrbNumber = jsonObject.get("jrbNumber").getAsString();
        jrlNumber = jsonObject.get("jrlNumber").getAsString();
        precinct = jsonObject.get("precinct").getAsString();
        cadastralUnit = jsonObject.get("cadastralUnit").getAsString();
        creationProof = jsonObject.get("creationProof").getAsString();
        creationDate = jsonObject.get("creationDate").getAsString();
        regon = jsonObject.get("regon").getAsString();
    }

    @Override
    public JsonObject toJson() {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("marker", marker);
        jsonObject.addProperty("jrgNumber", jrgNumber);
        jsonObject.addProperty("jrbNumber", jrbNumber);
        jsonObject.addProperty("jrlNumber", jrlNumber);
        jsonObject.addProperty("precinct", precinct);
        jsonObject.addProperty("cadastralUnit", cadastralUnit);
        jsonObject.addProperty("creationProof", creationProof);
        jsonObject.addProperty("creationDate", creationDate);
        jsonObject.addProperty("regon", regon);
        return jsonObject;
    }
}
