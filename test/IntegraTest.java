import integra.Integra;
import integra.IntegraServer;
import org.junit.Test;
import play.test.FunctionalTest;

public class IntegraTest extends FunctionalTest {

    @Test
    public void testIntegraCreateServer() {
        Integra integra = IntegraServer.createServer();
        assertNotNull(integra);
    }

}
