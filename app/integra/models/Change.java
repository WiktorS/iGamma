package integra.models;

import java.util.List;

public class Change extends IntegraModel {
    public String systematics;                  //Systematyka
    public String changeYear;                   //Rok zmiany
    public String changeName;                   //Numer zmiany
    public String applicationYear;              //Rok zgłoszenia
    public String applicationNumber;            //Numer zgłoszenia /Numer kancelaryjny/
    public String stockKerg;                    //Numer zasobu lub KERG
    public String applicationKind;              //Typ wniosku
    public String changeKind;                   //Rodzaj zmiany
    public String changeStatus;                 //Status zmiany
    public String changeDescription;            //Opis zmiany
    public String lotsAndLandRegister;          //Działki i KW
    public long applicationEntityID;            //Podmiot zgłaszający zmianę
    public String applicationEntityName;
    public String applicationEntityType;
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public String registeredBy;                 //Zarejestrował
    public String introducedBy;                 //Wprowadził
    public String acceptedBy;                   //Zaakceptował

    public List<IntegraModel> documents;        //Dokumenty
    public List<IntegraModel> lots;             //Działki zarejestrowane w Zmianie
    public List<IntegraEntity> members;         //Osoby zarejestrowane w Zmianie
    public List<RegisterUnitBase> registerUnits; //Jednostki Rejestrowe objęte Zmianą
    public List<RegisterUnitChange> registerUnitChanges;
}
