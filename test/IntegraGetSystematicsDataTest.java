import integra.Integra;
import integra.IntegraServer;
import integra.models.Systematic;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import play.test.FunctionalTest;

import java.util.List;

public class IntegraGetSystematicsDataTest extends FunctionalTest {
    Integra integra = IntegraServer.createServer();

    @Rule
    public ExpectedException thrown = ExpectedException.none();

    @Test
    public void testIntegraGetSystematics_should_Return_List_If_Null_Passed() throws Exception {
        List<Systematic> result = integra.getSystematics(null);
        assertNotNull(result);
    }

    @Test
    public void testIntegraGetSystematics_should_Return_Level_1and2_Children_If_Null_Passed() throws Exception {
        List<Systematic> result = integra.getSystematics(null);
        for (Systematic systematic : result) {
            if (systematic.parentId == 0) {
                boolean found = false;
                for (Systematic child : result) {
                    if (child.parentId == systematic.id) {
                        found = true;
                        break;
                    }
                }
                assertTrue(found);
            }
        }
    }

    @Test
    public void testIntegraGetSystematics_should_Return_Children_If_Id_Passed() throws Exception {
        List<Systematic> result = integra.getSystematics(new long[]{0});
        for (Systematic systematic : result) {
            assertTrue(systematic.parentId == 0);
        }
    }

    @Test
    public void testIntegraGetSystematics_should_Return_Empty_List_If_Passed_Bad_Id() throws Exception {
        List<Systematic> result = integra.getSystematics(new long[]{-1});
        assertNotNull(result);
        assertEquals(result.size(), 0);
    }
}
