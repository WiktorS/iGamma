package integra;

import com.sun.jna.Pointer;
import com.sun.jna.ptr.PointerByReference;
import integra.jna.INTEGRA_SYSTEMATIC;
import integra.jna.IntegraJNALibrary;
import integra.models.*;
import play.Logger;

import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

public class IntegraJnaImplementation implements Integra {
    private Pointer integraConnection;

    private String AnsiPszToString(byte[] psz)
    {
        int len = 0;
        while (psz[len] != '\0' && len < psz.length) { len++; };
        return new String(psz, 0, len, Charset.forName("windows-1250"));
    }

    public IntegraJnaImplementation()
    {
        PointerByReference refIntegraConnection = new PointerByReference();
        PointerByReference refError = new PointerByReference();
        int err = IntegraJNALibrary.IntegraJnaConnect(IntegraServer.integraOdbcName,
                IntegraServer.integraOdbcUser, IntegraServer.integraOdbcPass,
                IntegraServer.integraUser, IntegraServer.integraPass, refIntegraConnection, refError);
        if (err != 0)
        {
            Logger.error(AnsiPszToString(refError.getValue().getByteArray(0, 1024)));
            IntegraJNALibrary.IntegraJnaFree(refError.getValue());
        }
        else
        {
            integraConnection = refIntegraConnection.getValue();
        }
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
    public List<Systematic> getSystematics(long[] parentIdList) {
        List<Systematic> list = new ArrayList<Systematic>();
        IntBuffer lengthBuffer = IntBuffer.allocate(1);
        LongBuffer parentIdListBuffer;
        int parentIdListLength;
        if (parentIdList != null) {
            parentIdListBuffer = LongBuffer.wrap(parentIdList);
            parentIdListLength = parentIdList.length;
        }
        else {
            parentIdListBuffer = null;
            parentIdListLength = 0;
        }
        PointerByReference systematicListRef = new PointerByReference(Pointer.NULL);
        int err = IntegraJNALibrary.IntegraJnaGetSystematicList(integraConnection, parentIdListBuffer, parentIdListLength, systematicListRef, lengthBuffer);
        if (err == 0) {
            int length = lengthBuffer.get(0);
            if (length > 0) {
                INTEGRA_SYSTEMATIC[] systematicList = (INTEGRA_SYSTEMATIC[]) new INTEGRA_SYSTEMATIC(systematicListRef.getValue()).toArray(length);
                for (INTEGRA_SYSTEMATIC systematic : systematicList) {
                    Systematic item = new Systematic();
                    item.parentId = systematic.uiParentId;
                    item.id = systematic.uiId;
                    item.name = AnsiPszToString(systematic.szName);
                    item.desc = AnsiPszToString(systematic.szDesc);
                    list.add(item);
                }
                IntegraJNALibrary.IntegraJnaFree(systematicListRef.getValue());
            }
        }
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
