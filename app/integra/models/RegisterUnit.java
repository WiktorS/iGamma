package integra.models;

import java.util.List;

public class RegisterUnit extends IntegraModel {
    public String registerUnitType;
    public long jrgID;                          //Numer JRG
    public String jrgName;
    public long jrbID;                          //Numer JRB
    public String jrbName;
    public long jrlID;                          //Numer JRL
    public String jrlName;
    public String precinct;                     //Obręb
    public String cadastralUnit;                //Jednostka ewidencyjna
    public String creationProof;                //Dowód założenia
    public String creationDate;                 //Data założenia
    public String landRegister;                 //KW
    //Jrgib
    public String cadastralArea;                //Powierzchnia ewidencyjna
    public String householdKind;                //Rodzaj gospodarstwa
    public String regon;                        //REGON
    //OldJrg
    public String shareGroup;                   //Grupa rejestrowa
    //
    public List<IntegraModel> shares;           //Udziały
    public List<IntegraModel> lots;             //Działki
    public List<IntegraModel> buildings;        //Budynki
    public List<IntegraModel> locals;           //Lokale
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
}
