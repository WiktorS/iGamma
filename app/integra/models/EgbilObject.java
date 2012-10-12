package integra.models;

import java.util.List;

public class EgbilObject implements IntegraModel {
    public RegisterUnit registerUnit;
    public EgbilDocument document;
    public EgbilPerson person;
    public EgbilInstitution institution;
    public List<EgbilShare> shares;
    public List<EgbilLot> lots;
    public List<EgbilBuilding> buildings;
    public List<EgbilLocal> locals;
    public List<EgbilLandCommunity> landCommunities;
    public List<EgbilChange> changes;
}
