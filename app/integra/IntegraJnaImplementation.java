package integra;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;
import integra.jna.INTEGRA_SYSTEMATIC;
import integra.jna.IntegraJNALibrary;
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
    public List<Building> getBuildingByNumber(String numberB) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
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
            public void run(Pointer integraConnectionPtr) {
                PointerByReference systematicListRef = new PointerByReference();
                int err = IntegraJNALibrary.IntegraJnaGetSystematicList(integraConnectionPtr, parentIdListBuffer, parentIdListLength, systematicListRef, lengthBuffer);
                if (err == 0) {
                    int length = lengthBuffer.get(0);
                    if (length > 0) {
                        INTEGRA_SYSTEMATIC[] systematicList = (INTEGRA_SYSTEMATIC[]) new INTEGRA_SYSTEMATIC(systematicListRef.getValue()).toArray(length);
                        for (INTEGRA_SYSTEMATIC systematic : systematicList) {
                            Systematic item = new Systematic();
                            item.parentId = systematic.uiParentId;
                            item.id = systematic.uiId;
                            item.name = IntegraJna.AnsiPszToString(systematic.szName);
                            item.desc = IntegraJna.AnsiPszToString(systematic.szDesc);
                            list.add(item);
                        }
                        IntegraJNALibrary.IntegraJnaFree(systematicListRef.getValue());
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
}
