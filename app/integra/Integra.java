package integra;

import integra.models.EgbilDocument;
import integra.models.EgbilObject;
import integra.models.RegisterUnit;

import java.util.List;

public interface Integra {
    List<RegisterUnit> getRegisterUnits();
    List<RegisterUnit> getRegisterUnitsByJrgib(String jrgib);
    List<RegisterUnit> getRegisterUnitsByJrb(String jrb);
    List<RegisterUnit> getRegisterUnitsByJrl(String jrl);
    List<RegisterUnit> getRegisterUnitsByJrg(String jrg);
    EgbilObject getEgbilObject(String type, String name);
    List<EgbilDocument> getDocuments();
}
