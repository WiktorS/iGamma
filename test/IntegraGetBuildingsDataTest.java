import integra.Integra;
import integra.IntegraServer;
import integra.models.Building;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import play.test.FunctionalTest;

import java.util.List;

public class IntegraGetBuildingsDataTest extends FunctionalTest {
    Integra integra = IntegraServer.createServer();

    @Rule
    public ExpectedException thrown = ExpectedException.none();

    @Test
    public void testIntegraGetBuildingsData_should_Throw_If_Null_Passed() throws Exception {
        thrown.expect(Exception.class);
        thrown.expectMessage("List is null");
        List<Building> result = integra.getBuildings(null);
        fail("Should not get here");
    }

    @Test
    public void testIntegraGetBuildingsData_should_Throw_If_Empty_List_Passed() throws Exception {
        thrown.expect(Exception.class);
        thrown.expectMessage("List is empty");
        long[] idList = {};
        List<Building> result = integra.getBuildings(idList);
        fail("Should not get here");
    }

    @Test
    public void testIntegraGetBuildingsData_should_Throw_If_Bad_Id_Passed() throws Exception {
        thrown.expect(Exception.class);
        thrown.expectMessage("TBD");
        long[] idList = {-1};
        List<Building> result = integra.getBuildings(idList);
        fail("Should not get here");
    }

    @Test
    public void testIntegraGetBuildingsData_should_Return_1_Element_List_If_1_Id_Passed() throws Exception {
        long[] idList = {1};
        List<Building> result = integra.getBuildings(idList);
        assertNotNull(result);
        assertEquals(1, result.size());
        Building item = result.get(0);
        assertNotNull(item);
    }
}
