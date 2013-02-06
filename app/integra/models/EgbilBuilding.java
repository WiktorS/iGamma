package integra.models;

import java.util.List;

public class EgbilBuilding implements IntegraModel {
    public String marker;
    public String g5;
    public String precinct;
    public String buildingNumber;
    public String jrbNumber;
    public String jrgNumber;
    public String documentsSygnature;
    public String buildUpArea;
    public String usableArea;
    public String status;
    public String type;
    public String classType;
    public String highestLevel;
    public String lowestLevel;
    public String numberOfLevels;
    public List<String> addresses;
    public List<EgbilLot> lots;
    public List<EgbilDocument> documents;
    public List<EgbilLocal> locals;
    public String lotNumber;
    public String lotArea;
    public String constructionFinishDate;
    public String constructionFinishDateCertainty;
    public String reconstructionFinishDate;
    public String reconstructionFinishDateCertainty;
    public String reconstructionScope;
    public String exteriorWallsMaterial;
    public String numberOfUnits;
    public String monumentRegister;
    public String cadastralValue;
    public String valuationDate;
    public String manyJRG;
    public String remarks;
    public String notes;
}
