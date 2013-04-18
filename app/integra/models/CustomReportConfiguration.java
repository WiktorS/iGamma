package integra.models;

import java.util.List;

public class CustomReportConfiguration {
    public String name;                         //Nazwa
    public List<CustomReportAttribute> attributes; //Atrybuty
    public boolean attributeLegend;             //Legenda nazw atrybutów
    public long lineBreak;                      //Linia rozdzielająca
    public String fileFormat;                   //Format pliku
}
