package integra.models;

import java.util.List;

public class Person extends IntegraModel {
    public String pesel;                        //Numer PESEL
    public String surname;                      //Nazwisko
    public String firstName;                    //Pierwsze imię
    public String secondName;                   //Drugie imię
    public String sex;                          //Płeć
    public String fatherName;                   //Imię ojca
    public String motherName;                   //Imię matki
    public String citizenship;                  //Obywatelstwo
    public String status;                       //Status podmiotu
    public String nip;                          //Numer NIP
    public String identityDocument;             //Oznaczenie dokumentu tożsamości
    public long addressID;                      //Adres zamieszkania
    public String addressName;
    public long mailingAddressID;               //Adres korespondencyjny
    public String mailingAddressName;
    public String alive;                        //Żyje
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public List<IntegraModel> lots;             //Działki
    public List<IntegraModel> buildings;        //Budynki
    public List<IntegraModel> locals;           //Lokale
    public List<EntityShare> lotsShare;         //Udziały osoby w działkach
    public List<EntityShare> buildingsShare;    //Udziały osoby w budynkach
    public List<EntityShare> localsShare;       //Udziały osoby w lokalach
}
