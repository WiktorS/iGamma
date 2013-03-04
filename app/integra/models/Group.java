package integra.models;

import java.util.List;

public class Group extends IntegraModel {
    public String shortName;                    //Nazwa skrócona
    public String fullName;                     //Nazwa pełna
    public String status;                       //Status podmiotu
    public String regon;                        //Numer REGON
    public String nip;                          //Numer NIP
    public long addressID;                      //Adres
    public String addressName;
    public String registerName;                 //Nazwa rejestru osób prawnych
    public String registerNumber;               //Numer rejestru osób prawnych
    public String registerCourt;                //Nazwa sądu rejestrowego
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public List<IntegraModel> lots;             //Działki
    public List<IntegraModel> buildings;        //Budynki
    public List<IntegraModel> locals;           //Lokale
    public List<IntegraEntity> members;         //Skład
    public List<EntityShare> lotsShare;         //Udziały instytucji w działkach
    public List<EntityShare> buildingsShare;    //Udziały instytucji w budynkach
    public List<EntityShare> localsShare;       //Udziały instytucji w lokalach
}
