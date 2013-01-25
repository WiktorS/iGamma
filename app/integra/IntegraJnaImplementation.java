package integra;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;
import integra.jna.IGAMMA_QUERYENTRY;
import integra.jna.IGAMMA_QUERYRESULTS;
import integra.jna.IGAMMA_SYSTEMATIC;
import integra.jna.IGammaJNALibrary;
import integra.models.*;

import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.util.ArrayList;
import java.util.List;

public class IntegraJnaImplementation implements Integra {
    private IntegraJnaConnectionPool integraJnaConnectionPool;

    public IntegraJnaImplementation()
    {
        integraJnaConnectionPool = new IntegraJnaConnectionPool();
        //shutdown hook to cleanup integra connections
        IntegraJnaImplementationShutdownHook shutdownHook = new IntegraJnaImplementationShutdownHook();
        shutdownHook.integraJnaConnectionPool = integraJnaConnectionPool;
        Runtime.getRuntime().addShutdownHook(shutdownHook);
    }

    @Override
    public List<RegisterUnit> getRegisterUnits(String type) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Lot> getLotsByNumber(String number) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Building> getBuildings(QueryEntry[] queryEntryList) throws Exception {
        final List<Building> list = new ArrayList<Building>();
//        IGAMMA_QUERYENTRY jnaQueryEntry = new IGAMMA_QUERYENTRY();
//        final IGAMMA_QUERYENTRY[] jnaQueryEntryList = (IGAMMA_QUERYENTRY[])jnaQueryEntry.toArray(queryEntryList.length);//new IGAMMA_QUERYENTRY.ByValue[queryEntryList.size()];
//        for (int i = 0; i < queryEntryList.length; i++)
//        {
//            jnaQueryEntryList[i].iSize = jnaQueryEntryList[i].size();
//            if (queryEntryList[i] != null)
//            {
//                jnaQueryEntryList[i].szName = IntegraJna.StringToAnsiPsz(queryEntryList[i].name);
//                jnaQueryEntryList[i].szValue = IntegraJna.StringToAnsiPsz(queryEntryList[i].value);
//            }
//        }
//
//        new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
//            @Override
//            public void run(Pointer integraConnectionPtr) throws Exception {
//                PointerByReference resultListRef = new PointerByReference();
//                final IntBuffer resultCountBuffer = IntBuffer.allocate(1);
//                int err = IGammaJNALibrary.iGammaJnaFindObjects(integraConnectionPtr, "6. 2 Budynek na punktach graficznych", jnaQueryEntryList[0], jnaQueryEntryList.length, resultListRef, resultCountBuffer);
//                if (err == 0) {
//                    int length = resultCountBuffer.get(0);
//                    if (length > 0) {
//                        try {
//                            IGAMMA_QUERYRESULTS[] resultList = (IGAMMA_QUERYRESULTS[]) new IGAMMA_QUERYRESULTS(resultListRef.getValue()).toArray(length);
//                            for (IGAMMA_QUERYRESULTS result : resultList) {
//                                if (result.iSize != result.size())
//                                    throw new Exception("Nie poprawny rozmiar struktury wyników");
//                                Systematic item = new Systematic();
//                                item.parentId = systematic.uiParentId;
//                                item.id = systematic.uiId;
//                                item.name = IntegraJna.AnsiPszToString(systematic.szName);
//                                item.desc = IntegraJna.AnsiPszToString(systematic.szDesc);
//                                list.add(item);
//                            }
//                        } finally {
//                            IGammaJNALibrary.iGammaJnaFree(resultListRef.getValue());
//                        }
//                    }
//                }
//            }
//        };
        return list;
    }

    @Override
    public List<Local> getLocalByNumber(String numberL) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Person> getPersonByPesel(String pesel) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Institution> getInstitutionByNip(String nip) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Group> getGroupByNip(String nip) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<LandCommunity> getLandCommunities(String name) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public EgbilObject getEgbilObject(String type, String name) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<EgbilDocument> getDocuments() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Systematic> getSystematics(long[] parentIdList) throws Exception {
        final List<Systematic> list = new ArrayList<Systematic>();
        final IntBuffer lengthBuffer = IntBuffer.allocate(1);
        final LongBuffer parentIdListBuffer;
        final int parentIdListLength;
        if (parentIdList != null) {
            parentIdListBuffer = LongBuffer.wrap(parentIdList);
            parentIdListLength = parentIdList.length;
        }
        else {
            parentIdListBuffer = null;
            parentIdListLength = 0;
        }

        new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
            @Override
            public void run(Pointer integraConnectionPtr) throws Exception {
                PointerByReference systematicListRef = new PointerByReference();
                int err = IGammaJNALibrary.iGammaJnaGetSystematicList(integraConnectionPtr, parentIdListBuffer, parentIdListLength, systematicListRef, lengthBuffer);
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

    @Override
    public List<ShareSummary> getShareSummary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public CustomReportData getCustomReportData(String type, String name) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<EgbilObjectData> getRelatedObjects(String relation, EgbilObjectData[] objectList) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Long> findObjects(final String queryName, QueryEntry[] queryEntryList) throws Exception {
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

            new IntegraJnaConnectionWorker(integraJnaConnectionPool) {
                @Override
                public void run(Pointer integraConnectionPtr) throws Exception {
                    PointerByReference resultListRef = new PointerByReference();
                    final IntBuffer resultCountBuffer = IntBuffer.allocate(1);
                    int err = IGammaJNALibrary.iGammaJnaFindObjects(integraConnectionPtr, queryName, jnaQueryEntryList[0], jnaQueryEntryList.length, resultListRef, resultCountBuffer);
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
                            IGAMMA_QUERYRESULTS[] resultList = (IGAMMA_QUERYRESULTS[]) new IGAMMA_QUERYRESULTS(resultListRef.getValue()).toArray(length);
                            for (IGAMMA_QUERYRESULTS result : resultList) {
                                if (result.iSize != result.size())
                                    throw new Exception("Nie poprawny rozmiar struktury wyników");
                                list.add(result.iObjectID);
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
