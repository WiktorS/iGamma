package integra;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import integra.models.RegisterUnit;
import models.RegisterUnitMock;
import play.Play;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.*;

public class IntegraMock extends IntegraCommon implements Integra {

    private static Gson gson = new Gson();

    private File getMockFromFile(String methodName, String...params) {
        File result;
        Deque<String> paramList = new ArrayDeque<String>(Arrays.asList(params));
        boolean exitLoop = false;
        do {
            String fileName = methodName;
            for (String param : paramList) {
                fileName += "_" + param;
            }
            if (!paramList.isEmpty()) {
                paramList.removeLast();
            }
            else {
                exitLoop = true;
            }
            result = Play.getFile("mock/" + fileName + ".json");
        } while (!exitLoop && !result.exists());
        return result;
    }

    private <T> T getMockJson(String methodName, TypeToken<T> typeToken, String... params) {
        BufferedReader bufferedReader;
        T result = null;
        try {
            bufferedReader = new BufferedReader(new FileReader(getMockFromFile(methodName, params)));
            result = gson.fromJson(bufferedReader, typeToken.getType());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

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
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJson("getRegisterUnitsByJrg", typeToken, jrg);
    }
}
