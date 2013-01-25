package integra;

import integra.models.*;

import java.util.List;

public interface Integra {
    List<Long> findObjects(String queryName, QueryEntry[] queryArgs) throws Exception;

    List<RegisterUnit> getRegisterUnits(String type) throws Exception;
    List<Lot> getLotsByNumber(String number) throws Exception;
    List<Building> getBuildings(QueryEntry[] queryEntryList) throws Exception;
    List<Local> getLocalByNumber(String numberL) throws Exception;
    List<Person> getPersonByPesel(String pesel) throws Exception;
    List<Institution> getInstitutionByNip(String nip) throws Exception;
    List<Group> getGroupByNip(String nip) throws Exception;
    List<LandCommunity> getLandCommunities(String name) throws Exception;
    EgbilObject getEgbilObject(String type, String name) throws Exception;
    List<EgbilDocument> getDocuments() throws Exception;
    List<Systematic> getSystematics(long[] parentIdList) throws Exception;
    List<ShareSummary> getShareSummary() throws Exception;
    CustomReportData getCustomReportData(String type, String name) throws Exception;
    List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception;
}
