package integra;

import com.sun.jna.Pointer;

import java.util.Date;

public class IntegraJnaConnection {
    private final Pointer integraConnection;
    private Date lastUsedDate;
    private volatile Boolean isInUse = false;

    private void UpdateLastUsedDate() {
        lastUsedDate = new Date();
    }

    public IntegraJnaConnection(Pointer connection) {
        integraConnection = connection;
        UpdateLastUsedDate();
    }

    public Pointer GetIntegraConnection() {
        UpdateLastUsedDate();
        return integraConnection;
    }

    public boolean IsValid() {
        Date currentDate = new Date();
        long diff = currentDate.getTime() - lastUsedDate.getTime();
        long diffMinutes = diff / (60 * 1000);
        return diffMinutes < IntegraServer.integraPoolOutdatedTime;
    }

    public boolean IsInUse() {
        return isInUse;
    }

    public void SetInUse() {
        isInUse = true;
    }

    public void SetInUse(boolean inUse) {
        isInUse = inUse;
    }
}
