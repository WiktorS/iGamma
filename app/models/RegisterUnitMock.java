package models;

import play.db.jpa.Model;

import javax.persistence.Entity;

@Entity
public class RegisterUnitMock extends Model {
    public String jrg;
    public String jrb;
}
