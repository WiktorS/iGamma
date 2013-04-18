package integra.models;

import java.util.List;

public class CadastralUnit extends IntegraModel{
    public String name;                         //Numer
    public String desc;                         //Nazwa własna
    public List<IntegraModel> precincts;        //Obręby
}
