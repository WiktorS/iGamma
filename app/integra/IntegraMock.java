package integra;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import integra.models.*;
import play.Logger;
import play.Play;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

public class IntegraMock implements Integra {

    private static final Gson gson = new GsonBuilder().excludeFieldsWithModifiers(Modifier.PRIVATE).create();

    private <T> T getMockJsonData(String methodName, TypeToken<T> typeToken, String... params) {
        BufferedReader bufferedReader;
        T result = null;
        try {
            bufferedReader = new BufferedReader(new FileReader(getMockFile(methodName, params)));
            result = gson.fromJson(bufferedReader, typeToken.getType());
            bufferedReader.close();
        } catch (Exception e) {
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
    public List<RegisterUnit> getRegisterUnits(String type) {
        TypeToken<List<RegisterUnit>> typeToken = new TypeToken<List<RegisterUnit>>() {};
        return getMockJsonData("getRegisterUnits", typeToken, type);
    }

    @Override
    public List<Lot> getLotsByNumber(String number) {
        TypeToken<List<Lot>> typeToken = new TypeToken<List<Lot>>() {};
        return getMockJsonData("getLotsByNumber", typeToken, number);
    }

    @Override
    public List<Building> getBuildingByNumber(String numberB) {
        TypeToken<List<Building>> typeToken = new TypeToken<List<Building>>() {};
        return getMockJsonData("getBuildingByNumber", typeToken, numberB);
    }

    @Override
    public List<Local> getLocalByNumber(String numberL) {
        TypeToken<List<Local>> typeToken = new TypeToken<List<Local>>() {};
        return getMockJsonData("getLocalByNumber", typeToken, numberL);
    }

    @Override
    public List<Person> getPersonByPesel(String pesel) {
        TypeToken<List<Person>> typeToken = new TypeToken<List<Person>>() {};
        return getMockJsonData("getPersonByPesel", typeToken, pesel);
    }

    @Override
    public List<Institution> getInstitutionByNip(String nip) {
        TypeToken<List<Institution>> typeToken = new TypeToken<List<Institution>>() {};
        return getMockJsonData("getInstitutionByNip", typeToken, nip);
    }

    @Override
    public List<Group> getGroupByNip(String nip) {
        TypeToken<List<Group>> typeToken = new TypeToken<List<Group>>() {};
        return getMockJsonData("getGroupByNip", typeToken, nip);
    }

    @Override
    public List<LandCommunity> getLandCommunities(String name) {
        TypeToken<List<LandCommunity>> typeToken = new TypeToken<List<LandCommunity>>() {};
        return getMockJsonData("getLandCommunities", typeToken, name);
    }

    @Override
    public EgbilObject getEgbilObject(String type, String name) {
        TypeToken<EgbilObject> typeToken = new TypeToken<EgbilObject>() {};
        return getMockJsonData("getEgbilObject", typeToken, type, name);
    }

    @Override
    public List<EgbilDocument> getDocuments() {
        TypeToken<List<EgbilDocument>> typeToken = new TypeToken<List<EgbilDocument>>() {};
        return getMockJsonData("getDocuments", typeToken);
    }

    @Override
    public List<Systematic> getSystematics() {
        TypeToken<List<Systematic>> typeToken = new TypeToken<List<Systematic>>() {};
        return getMockJsonData("getSystematics", typeToken);
    }

    @Override
    public List<ShareSummary> getShareSummary() {
        TypeToken<List<ShareSummary>> typeToken = new TypeToken<List<ShareSummary>>() {};
        return getMockJsonData("getShareSummary", typeToken);
    }
}
