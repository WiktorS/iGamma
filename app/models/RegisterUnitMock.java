package models;

import integra.models.RegisterUnit;
import play.db.jpa.Model;

import javax.persistence.Entity;

@Entity
public class RegisterUnitMock extends Model {
    public String jrg;
    public String jrb;

    public RegisterUnit toRegisterUnit()
    {
        RegisterUnit registerUnit = new RegisterUnit();
        registerUnit.jrb = jrb;
        registerUnit.jrg = jrg;
        return registerUnit;
    }
}
