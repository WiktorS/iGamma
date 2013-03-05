package integra;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;
import integra.jna.IGAMMA_BUILDING;
import integra.jna.IGAMMA_QUERYENTRY;
import integra.jna.IGAMMA_SYSTEMATIC;
import integra.jna.IGammaJNALibrary;
import integra.models.*;

import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.List;

public class IntegraJnaImplementation implements Integra {
    private IntegraJnaConnectionPool integraJnaConnectionPool;

    public IntegraJnaImplementation()
    {
        integraJnaConnectionPool = new IntegraJnaConnectionPool();
    }

    @Override
    public List<Building> getBuildings(final long idList[]) throws Exception {
        final List<Building> list = new ArrayList<Building>();

        if (idList == null || idList.length == 0)
            throw new Exception("Parameters expected");

        new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
            @Override
            public void run(Pointer integraConnectionPtr) throws Exception {
                PointerByReference resultListRef = new PointerByReference();
                final IntBuffer resultCountBuffer = IntBuffer.allocate(1);
                int err = IGammaJNALibrary.iGammaJnaGetBuildingsData(integraConnectionPtr, idList, idList.length, resultListRef, resultCountBuffer);
                if (err == 0) {
                    int length = resultCountBuffer.get(0);
                    if (length > 0) {
                        try {
                            IGAMMA_BUILDING[] buildingList = (IGAMMA_BUILDING[]) new IGAMMA_BUILDING(resultListRef.getValue()).toArray(length);
                            for (IGAMMA_BUILDING building : buildingList) {
                                if (building.iSize != building.size())
                                    throw new Exception("Nie poprawny rozmiar struktury budynków");
                                Building item = new Building();
                                item.id = building.iID;
//                                item.buildingNumber = IntegraJna.AnsiPszToString(building.buildingNumber);
//                                item.lotNumber = IntegraJna.AnsiPszToString(building.lotNumber);
//                                item.jrgNumber = IntegraJna.AnsiPszToString(building.jrgNumber);
//                                item.jrbNumber = IntegraJna.AnsiPszToString(building.jrbNumber);
//                                item.precinct = IntegraJna.AnsiPszToString(building.precinct);
//                                item.cadastralUnit = IntegraJna.AnsiPszToString(building.cadastralUnit);
////                                item.constructionFinishDate = IntegraJna.AnsiPszToString(building.finishYear);
//                                item.type = IntegraJna.AnsiPszToString(building.type);
//                                item.buildUpArea = IntegraJna.AnsiPszToString(building.buildUpArea);
                                list.add(item);
                            }
                        } finally {
                            IGammaJNALibrary.iGammaJnaFree(resultListRef.getValue());
                        }
                    }
                }
            }
        };
        return list;
    }

    @Override
    public List<Document> getDocuments(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Group> getGroups(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Person> getPersons(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Institution> getInstitutions(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrg(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrb(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getJrl(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<RegisterUnit> getOldJrg(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<LandCommunity> getLandCommunities(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Local> getLocals(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Lot> getLots(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Address> getAddresses(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Share> getShares(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Change> getChanges(long[] idList) throws Exception {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Systematic> getSystematics(final long[] parentIdList) throws Exception {
        final List<Systematic> list = new ArrayList<Systematic>();
        final IntBuffer lengthBuffer = IntBuffer.allocate(1);
        final int parentIdListLength = parentIdList != null ? parentIdList.length : 0;

        new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
            @Override
            public void run(Pointer integraConnectionPtr) throws Exception {
                PointerByReference systematicListRef = new PointerByReference();
                int err = IGammaJNALibrary.iGammaJnaGetSystematicsData(integraConnectionPtr, parentIdList, parentIdListLength, systematicListRef, lengthBuffer);
                if (err == 0) {
                    int length = lengthBuffer.get(0);
                    if (length > 0) {
                        try{
                            IGAMMA_SYSTEMATIC[] systematicList = (IGAMMA_SYSTEMATIC[]) new IGAMMA_SYSTEMATIC(systematicListRef.getValue()).toArray(length);
                            for (IGAMMA_SYSTEMATIC systematic : systematicList) {
                                Systematic item = new Systematic();
                                item.parentId = systematic.uiParentId;
                                item.id = systematic.uiId;
                                item.name = IntegraJna.AnsiPszToString(systematic.szName);
                                item.desc = IntegraJna.AnsiPszToString(systematic.szDesc);
                                list.add(item);
                            }
                        } finally {
                            IGammaJNALibrary.iGammaJnaFree(systematicListRef.getValue());
                        }
                    }
                }
            }
        };
        return list;
    }
//
//    @Override
//    public List<ShareSummary> getShareSummary() {
//        return null;  //To change body of implemented methods use File | Settings | File Templates.
//    }
//
//    @Override
//    public CustomReportData getCustomReportData(String type, String name) {
//        return null;  //To change body of implemented methods use File | Settings | File Templates.
//    }
//
//    @Override
//    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) {
//        return null;  //To change body of implemented methods use File | Settings | File Templates.
//    }

    @Override
    public List<Long> findObjects(String queryName, QueryEntry[] queryEntryList) throws Exception {
        final List<Long> list = new ArrayList<Long>();

        if (queryEntryList != null && queryEntryList.length > 0)
        {
            //Java array to C++ array
            final IGAMMA_QUERYENTRY jnaQueryEntry = new IGAMMA_QUERYENTRY();
            final IGAMMA_QUERYENTRY[] jnaQueryEntryList = (IGAMMA_QUERYENTRY[])jnaQueryEntry.toArray(queryEntryList.length);
            for (int i = 0; i < queryEntryList.length; i++)
            {
                jnaQueryEntryList[i].iSize = jnaQueryEntryList[i].size();
                if (queryEntryList[i] != null)
                {
                    jnaQueryEntryList[i].szName = IntegraJna.StringToAnsiPsz(queryEntryList[i].name);
                    jnaQueryEntryList[i].szValue = IntegraJna.StringToAnsiPsz(queryEntryList[i].value);
                }
            }

            final String finalQueryName = queryName;
            new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
                @Override
                public void run(Pointer integraConnectionPtr) throws Exception {
                    PointerByReference resultListRef = new PointerByReference();
                    final IntBuffer resultCountBuffer = IntBuffer.allocate(1);
                    int err = IGammaJNALibrary.iGammaJnaFindObjects(integraConnectionPtr, finalQueryName, jnaQueryEntryList[0], jnaQueryEntryList.length, resultListRef, resultCountBuffer);
                    if (err != 0) {
                        String errorMessage = "Unexpected error";
                        PointerByReference refErrorMsg = new PointerByReference();
                        if (0 == IGammaJNALibrary.iGammaJnaGetLastError(integraConnectionPtr, refErrorMsg)) {
                            errorMessage = IntegraJna.AnsiPszToString(refErrorMsg.getValue());
                            IGammaJNALibrary.iGammaJnaFree(refErrorMsg.getValue());
                        }
                        throw new Exception(errorMessage);
                    }

                    int length = resultCountBuffer.get(0);
                    if (length > 0) {
                        try {
                            long[] resultList = resultListRef.getValue().getLongArray(0, length);
                            //TODO: Since we know the length of resultList wh could force list to allocate needed amount of memory, but how?
                            for (long objectID : resultList) {
                                list.add(objectID);
                            }
                        } finally {
                            IGammaJNALibrary.iGammaJnaFree(resultListRef.getValue());
                        }
                    }
                }
            };
        }
        return list;
    }
}
