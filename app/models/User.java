package models;

import org.mindrot.jbcrypt.BCrypt;
import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class User extends Model {
    public static final long PERMISSION_ADMIN=1<<32;

    @Column(unique=true, nullable=false)
    public String login;
    @Column(nullable=false)
    public String password;
    @Column(nullable=false)
    public String firstName;
    @Column(nullable=false)
    public String lastName;
    @Column(nullable=false)
    public boolean isActive;
    @Column(nullable=false)
    public long permissions;
    @ManyToOne
    public Link link;

    public User(String login, String password, String firstName, String lastName) {
        this.isActive = true;
        this.login = login;
        this.firstName = firstName;
        this.lastName = lastName;
        this.permissions = 0;
        setPassword(password);
    }

    public void setPassword(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public boolean isValidPassword(String password) {
        return BCrypt.checkpw(password, this.password);
    }
}
