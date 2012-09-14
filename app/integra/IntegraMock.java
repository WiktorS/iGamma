package integra;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import integra.models.EgbilObject;
import integra.models.RegisterUnit;
import models.RegisterUnitMock;
import play.Logger;
import play.Play;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.lang.reflect.Modifier;
import java.util.*;

public class  IntegraMock implements Integra {

    private static final Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.PRIVATE).create();

    private <T> T getMockJsonData(String methodName, TypeToken<T> typeToken, String... params) {
        BufferedReader bufferedReader;
        T result = null;
        try {
            bufferedReader = new BufferedReader(new FileReader(getMockFile(methodName, params)));
            result = gson.fromJson(bufferedReader, typeToken.getType());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    private File getMockFile(String methodName, String...params) {
        Deque<String> paramsDeque = prepareParamsDeque(params);
        return findMockFileByParams(methodName, paramsDeque);
    }

    private Deque<String> prepareParamsDeque(String...params) {
        List<String> paramList = new ArrayList<String>();
        for (String param: params) {
            paramList.add(param != null ? param : "null");
        }
        Deque<String> paramsDeque = new ArrayDeque<String>(paramList);
        return paramsDeque;
    }

    private File findMockFileByParams(String methodName, Deque<String> paramsDeque) {
        File result;
        boolean exitLoop = false;
        do {
            String fileName = methodName;
            for (String param : paramsDeque) {
                fileName += "_" + param;
            }
            if (!paramsDeque.isEmpty()) {
                paramsDeque.removeLast();
            }
            else {
                exitLoop = true;
            }
            result = Play.getFile("mock/" + fileName + ".json");
            Logger.debug("Trying to load mock '%s'", fileName);
        } while (!exitLoop && !result.exists());
        return result;
    }


    @Override
    public List<RegisterUnit> getRegisterUnits() {
        List<RegisterUnitMock> registerUnitMocks = RegisterUnitMock.findAll();
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return gson.fromJson(gson.toJsonTree(registerUnitMocks), typeToken.getType());
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrgib(String jrgib) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnitsByJrgib", typeToken, jrgib);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrb(String jrb) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnitsByJrb", typeToken, jrb);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrl(String jrl) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnitsByJrl", typeToken, jrl);
    }

    @Override
    public List<RegisterUnit> getRegisterUnitsByJrg(String jrg) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnitsByJrg", typeToken, jrg);
    }

    @Override
    public List<RegisterUnit> getLotsByNumber(String number) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getLotsByNumber", typeToken, number);
    }

    @Override
    public EgbilObject getEgbilObject(String type, String name) {
        TypeToken<EgbilObject> typeToken = new TypeToken<EgbilObject>() {};
        return getMockJsonData("getEgbilObject", typeToken, type, name);
    }
}
