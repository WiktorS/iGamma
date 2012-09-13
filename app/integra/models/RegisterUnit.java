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
    public String number;
    public String cadastralSheet;
    public String numberJRG;
    public String address;
    public String document;
    public String cadastralArea;

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
        number = jsonObject.get("number").getAsString();
        cadastralSheet = jsonObject.get("cadastralSheet").getAsString();
        numberJRG = jsonObject.get("numberJRG").getAsString();
        address = jsonObject.get("address").getAsString();
        document = jsonObject.get("document").getAsString();
        cadastralArea = jsonObject.get("cadastralArea").getAsString();
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
        jsonObject.addProperty("number", number);
        jsonObject.addProperty("cadastralSheet", cadastralSheet);
        jsonObject.addProperty("numberJRG", numberJRG);
        jsonObject.addProperty("address", address);
        jsonObject.addProperty("document", document);
        jsonObject.addProperty("cadastralArea", cadastralArea);
        return jsonObject;
    }
}
