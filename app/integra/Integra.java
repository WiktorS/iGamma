package integra;

import integra.models.*;

import java.util.List;

public interface Integra {
    List<Long> findObjects(String queryName, QueryEntry[] queryArgs) throws Exception;

    List<Building> getBuildings(long idList[]) throws Exception;
    List<Document> getDocuments(long idList[]) throws Exception;
    List<Group> getGroups(long idList[]) throws Exception;
    List<Person> getPersons(long idList[]) throws Exception;
    List<Institution> getInstitutions(long idList[]) throws Exception;
    List<RegisterUnit> getJrg(long idList[]) throws Exception;
    List<RegisterUnit> getJrb(long idList[]) throws Exception;
    List<RegisterUnit> getJrl(long idList[]) throws Exception;
    List<RegisterUnit> getOldJrg(long idList[]) throws Exception;
    List<LandCommunity> getLandCommunities(long idList[]) throws Exception;
    List<Local> getLocals(long idList[]) throws Exception;
    List<Lot> getLots(long idList[]) throws Exception;
    List<Address> getAddresses(long idList[]) throws Exception;
    List<Share> getShares(long[] idList) throws Exception;
    List<Change> getChanges(long[] idList) throws Exception;

    List<Systematic> getSystematics(long[] parentIdList) throws Exception;

//    List<ShareSummary> getShareSummary() throws Exception;
//    CustomReportData getCustomReportData(String type, String name) throws Exception;
//    List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) throws Exception;
}
