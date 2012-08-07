import models.RegisterUnitMock;
import play.jobs.Job;
import play.jobs.OnApplicationStart;
import play.test.Fixtures;

@OnApplicationStart
public class PlayBootstrapJob extends Job {

    @Override
    public void doJob() {
        if (RegisterUnitMock.count()==0) {
            Fixtures.deleteAllModels();
            Fixtures.loadModels("initial-data.yml");
        }
    }

}
