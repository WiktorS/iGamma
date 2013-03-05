package integra.models;

import java.util.List;

public class Building extends IntegraModel {
    public String buildingName;                 //Numer
    public long jrbID;                          //Numer JRB
    public String jrbName;
    public long jrgID;                          //Numer JRG
    public String jrgName;
    public String jrgType;
    public String precinct;                     //Obręb
    public String sheet;                        //Arkusz
    public String cadastralUnit;                //Jednostka ewidencyjna
    public List<IntegraModel> lots;             //Działki
    public String buildingArea;                 //Powierzchnia zabudowy
    public String usableArea;                   //Powierzchnia użytkowa
    public String buildingStatus;               //Status budynku
    public String buildingClass;                //Klasa budynku
    public String highestLevel;                 //Numer najwyższej kondygnacji
    public String lowestLevel;                  //Numer najniższej kondygnacji
    public String numberOfLevels;               //Łączna liczba kondygnacji
    public List<IntegraModel> addresses;        //Adresy
    public List<IntegraModel> documents;        //Dokumenty
    public String constructionFinishDate;       //Data zakończenia budowy
    public String constructionFinishDateCertainty;  //Stopień pewności ustalenia daty zakończenia budowy
    public String reconstructionFinishDate;     //Data zakończenia przebudowy
    public String reconstructionFinishDateCertainty;    //Stopień pewności ustalenia daty zakończenia przebudowy
    public String reconstructionScope;          //Zakres przebudowy
    public String exteriorWallsMaterial;        //Materiał ścian zewnętrznych
    public String buildingKind;                 //Typ budynku
    public String numberOfLocals;               //Liczba wszystkich lokali
    public String monumentRegister;             //Rejestr zabytków
    public String cadastralValue;               //Wartość katastralna
    public String valuationDate;                //Data wyceny
    public String manyJRG;                      //Wiele JRG
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public List<IntegraModel> locals;           //Lokale
}
