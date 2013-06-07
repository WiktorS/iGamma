package models;

import com.google.gson.annotations.Expose;
import org.mindrot.jbcrypt.BCrypt;
import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class User extends Model {
    public static final long PERMISSION_ADMIN=1<<31;

    @Expose
    @Column(unique=true, nullable=false)
    public String login;
    @Column(nullable=false)
    private String password;
    @Expose
    @Column(nullable=false)
    public String firstName;
    @Expose
    @Column(nullable=false)
    public String lastName;
    @Expose
    @Column(nullable=false)
    public boolean isActive;
    @Expose
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
