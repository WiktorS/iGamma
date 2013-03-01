package integra.models;

import java.util.List;

public class LandCommunity extends IntegraModel {
    public String landCommunityName;            //Nazwa spółki
    public String status;                       //Status podmiotu
    public long addressID;                      //Adres
    public String addressName;
    public long landCommunityInstitutionID;     //Wspólnota gruntowa
    public String landCommunityInstitutionName;
    public String remarks;                      //Uwagi
    public String notes;                        //Notatki
    public List<IntegraEntity> members;         //Skład
}
