package integra.models;

import java.util.List;

public class CustomReportData {
    public List<CustomReportAttribute> attributes; //List atrybutów
    public List<CustomReportConfiguration> configurations; //Konfiguracje
    public boolean attributeLegend;             //Legenda nazw atrybutów
    public long lineBreak;                      //Linia rozdzielająca
    public String fileFormat;                   //Format pliku
}
