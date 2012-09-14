package integra.models;

import java.util.List;

public class EgbilObject implements IntegraModel {
    public RegisterUnit registerUnit;
    public List<EgbilShare> shares;
    public List<EgbilLot> lots;
    public List<EgbilBuilding> buildings;
    public List<EgbilLocal> locals;
}
