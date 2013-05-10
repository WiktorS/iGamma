package models;

import play.db.jpa.Model;

public class UserSessionData extends Model {
    public String userName;
    public String fullName;
    public String authToken;
}
