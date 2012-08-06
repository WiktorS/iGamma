package integra;

import integra.models.RegisterUnit;
import models.RegisterUnitMock;

import java.util.ArrayList;
import java.util.List;

public class IntegraMock implements Integra {
    private List<RegisterUnit> registerUnitMocksToRegisterUnits(List<RegisterUnitMock> registerUnitMocks) {
        List<RegisterUnit> registerUnits = new ArrayList<RegisterUnit>();
        if (registerUnitMocks != null)
            for (RegisterUnitMock registerUnitMock : registerUnitMocks) {
                registerUnits.add(registerUnitMock.toRegisterUnit());
            }
        return registerUnits;
    }

    @Override
    public List<RegisterUnit> getRegisterUnits() {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.findAll();
        return registerUnitMocksToRegisterUnits(registerUnitMocks);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrb = ?", jrb).fetch();
        return registerUnitMocksToRegisterUnits(registerUnitMocks);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrg = ?", jrg).fetch();
        return registerUnitMocksToRegisterUnits(registerUnitMocks);
    }
}
