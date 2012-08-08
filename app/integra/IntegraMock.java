package integra;

import com.google.gson.Gson;
import integra.models.RegisterUnit;
import models.RegisterUnitMock;

import java.util.List;

public class IntegraMock extends IntegraCommon implements Integra {

    private static Gson gson = new Gson();

    @Override
    public List<RegisterUnit> getRegisterUnits() {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.findAll();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrb = ?", jrb).fetch();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.find("jrg = ?", jrg).fetch();
        return listFromJson(gson.toJsonTree(registerUnitMocks), RegisterUnit.class);
    }
}
