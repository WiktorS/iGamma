package integra;

import integra.models.RegisterUnit;

import java.util.List;

public interface Integra {
    List<RegisterUnit> getRegisterUnits();
    List<RegisterUnit> getRegisterUnitsByJrb(String jrb);
    List<RegisterUnit> getRegisterUnitsByJrg(String jrg);
    List<RegisterUnit> getRegisterUnitsByJrl(String jrl);
    List<RegisterUnit> getLotsByNumber(String number);
}
