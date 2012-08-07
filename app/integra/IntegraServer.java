package integra;

import play.Play;

public class IntegraServer {

    public static Integra createServer() {
        if (Play.configuration.get("integra.db").equals("mock")) {
            return new IntegraMock();
        } else {
            return new IntegraImplementation();
        }
    }

}
