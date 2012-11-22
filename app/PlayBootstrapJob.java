import play.jobs.Job;
import play.jobs.OnApplicationStart;

@OnApplicationStart
public class PlayBootstrapJob extends Job {

    @Override
    public void doJob() {
    }

}
