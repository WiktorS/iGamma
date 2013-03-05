package integra.models;

import java.util.List;

public class Local extends IntegraModel {
    public String precinct;                     //Obręb - lista
    public String cadastralUnit;                //Jednostka ewidencyjna
    public String localName;                    //Numer lokalu
    public long jrgID;                          //Numer JRG
    public String jrgName;
    public String jrgType;
    public long jrlID;                          //Numer JRL
    public String jrlName;
    public long addressID;                      //Adres
    public String addressName;
    public List<IntegraModel> documents;        //Dokumenty
    public String usableArea;                   //Powierzchnia użytkowa
    public String localKind;                    //Typ lokalu
    public String localLevel;                   //Kondygnacja
    public List<AssociatedPremise> associatedPremises; //Pomieszczenia przynależne
    public String associatedPremisesAreaSum;    //Łączna powierzchnia pomieszczeń przynależnych
    public String roomsNumber;                  //Liczba izb
    public String commonPropertyShare;          //Udział w nieruchomości wspólnej 
    public long lotID;                          //Działka
    public String lotName; 
    public long buildingID;                     //Budynek
    public String buildingName;    
    public String cadastralValue;               //Wartość katastralna
    public String valuationDate;                //Data wyceny
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public List<LocalRight> rights;             //Prawa związane
}
