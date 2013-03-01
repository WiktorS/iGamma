package integra.models;

public class Share extends IntegraModel {
    public long jrgID;
    public long jrbID;
    public long jrlID;
    public String characterG;                   //Charakter władania G
    public String characterB;                   //Charakter władania B
    public String characterL;                   //Charakter władania L
    public String shareValue;                   //Udział
    public String registerGroupG;               //Grupa rejestrowa G
    public String registerGroupB;               //Grupa rejestrowa B
    public String registerGroupL;               //Grupa rejestrowa L
    public long entityID;                       //Podmiot
    public String entityType;
    public String entityName;                   
    public String peselRegon;                   //PESEL/REGON
    public String addressID;                    //Adres
    public String addressName;                  
    public String shareRemarks;                 //Udział.Uwagi
    public String personRemarks;                //Osoba.Uwagi
}
