package integra.models;

import java.util.List;

public class Document extends IntegraModel {
    public String documentName;                 //Sygnatura (SYG)
    public String documentKind;                 //Rodzaj (KDK)
    public String documentSource;               //Źródło (NSR) zmiana nazwy: Nazwa sądu rejonowego
    public String creationDate;                 //Data sporządzenia (DTD) zmiana nazwy: Data wystawienia
    public String receiptDate;                  //Data wpływu (DTP) zmiana nazwy: data przyjęcia do zasobu
    public String description;                  //Opis (OPD)
    public String designation;                  //Oznaczenie (IDM)
    public long relatedDocumentID;              //Dokument związany
    public String relatedDocumentName;
    public String relatedDocumentKind;          //Rodzaj dokumentu związanego
    // relatedType
    // relatedSygnature
    public String scan;                         //Skan /Nazwa pliku/
    public List<IntegraModel> lots;             //Działki
    public List<IntegraModel> buildings;        //Budynki
    public List<IntegraModel> locals;           //Lokale
    public List<IntegraModel> changes;          //Zmiany
}
