package models;

import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Link extends Model{
    @Column(length=64)
    public String name;
    @Column(length=256)
    public String fullName;
    @Column(unique=true)
    public String cumLogin;
    @Column(nullable=false)
    public String cumPassword;
    @Column(nullable=false)
    public boolean isAdmin;

    @OneToMany(mappedBy = "link")
    public List<User> users;

    public Link(String name, String fullName, String cumLogin, String cumPassword) {
        this.name = name;
        this.fullName = fullName;
        this.cumLogin = cumLogin;
        this.cumPassword = cumPassword;
        this.isAdmin = false;
    }
}
