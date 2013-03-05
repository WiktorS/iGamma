package integra.models;

import java.util.List;

public class Lot extends IntegraModel {
    public String lotName;                      //Number działki
    public String precinct;                     //Obręb
    public String sheet;                        //Arkusz
    public String cadastralUnit;                //Jednostka ewidencyjna
    public long jrgID;                          //Numer JRG
    public String jrgName;    
    public String jrgType;
    public String cadastralArea;                //Powierzchnia ewidencyjna
    public String geodesicArea;                 //Powierzchnia geodezyjna
    public List<IntegraModel> addresses;        //Adresy
    public List<IntegraModel> documents;        //Dokumenty
    public List<TerrainCategory> terrainCategories;  //Klasoużytki
    public List<IntegraModel> shares;           //Udziały
    public String monumentRegister;             //Rejestr zabytków
    public String statisticalRegion;            //Rejon statystyczny
    public String listDistrict;                 //Obwód spisowy
    public String validFrom;                    //Ważność od 
    public String validTo;                      //Ważność do - Data upływu prawa
    public String cadastralValue;               //Wartość katastralna
    public String valuationDate;                //Data wyceny
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
}
