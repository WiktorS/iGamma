import integra.Integra;
import integra.IntegraServer;
import integra.models.Systematic;
import org.junit.Test;
import play.test.FunctionalTest;

import java.util.List;

public class IntegraGetSystematicsTest extends FunctionalTest {

    @Test
    public void testIntegraGetSystematics_shouldReturnListIfNullPassed() throws Exception {
        Integra integra = IntegraServer.createServer();
        List<Systematic> result = integra.getSystematics(null);
        assertNotNull(result);
    }

    @Test
    public void testIntegraGetSystematics_shouldReturn2LevelChildrenIfNullPassed() throws Exception {
        Integra integra = IntegraServer.createServer();
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
    public void testIntegraGetSystematics_shouldReturnChildrenIfIdPassed() throws Exception {
        Integra integra = IntegraServer.createServer();
        List<Systematic> result = integra.getSystematics(new long[]{0});
        for (Systematic systematic : result) {
            assertTrue(systematic.parentId == 0);
        }
    }

    @Test
    public void testIntegraGetSystematics_shouldReturnEmptyListIfPassedBadId() throws Exception {
        Integra integra = IntegraServer.createServer();
        List<Systematic> result = integra.getSystematics(new long[]{-1});
        assertTrue(result.isEmpty());
    }
}
