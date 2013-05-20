package models;

import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Link extends Model{
    @Column(unique=true, nullable=false)
    public String name;
    @Column(nullable=false)
    public String cumLogin;
    @Column(nullable=false)
    public String cumPassword;

    @OneToMany(mappedBy = "link")
    public List<User> users;

    public Link(String name, String cumLogin, String cumPassword) {
        this.name = name;
        this.cumLogin = cumLogin;
        this.cumPassword = cumPassword;
    }
}
