App.Router.map ->
  @resource "egbil", ->
    @route "egbilMap", {path: "mapa"}
    @resource "egbilSearch", {path: "szukaj"}, ->
      @route "jrg", {path: "jednostki rejestrowe gruntów i budynków"}
      @route "jrb", {path: "jednostki rejestrowe budynków"}
      @route "jrl", {path: "jednostki rejestrowe lokali"}
      @route "oldJrg", {path: "stare jednostki rejestrowe gruntów"}
      @route "lot", {path: "działki"}
      @route "building", {path: "budynki"}
      @route "local", {path: "lokale"}
      @route "person", {path: "osoby fizyczne"}
      @route "institution", {path: "instytucje"}
      @route "group", {path: "podmioty grupowe"}
      @route "landCommunity", {path: "zarządy wspolnot gruntowych"}
      @route "document", {path: "dokumenty"}
    @route "egbilList", {path: "wyniki"}
    @resource "egbilObject", {path: "obiekt"}, ->
      @route "jrg", {path: "jednostka rejestrowa gruntów i budynków/:name/:id"}
      @route "jrb", {path: "jednostka rejestrowa budynków/:name/:id"}
      @route "jrl", {path: "jednostka rejestrowa lokali/:name/:id"}
      @route "oldJrg", {path: "stara jednostka rejestrowa gruntów/:name/:id"}
      @route "document", {path: "dokument/:name/:id"}
      @route "lot", {path: "działka/:name/:id"}
      @route "building", {path: "budynek/:name/:id"}
      @route "local", {path: "lokal/:name/:id"}
      @route "person", {path: "osoba fizyczne/:name/:id"}
      @route "institution", {path: "instytucja/:name/:id"}
      @route "group", {path: "podmiot grupowy/:name/:id"}
      @route "landCommunity", {path: "zarząd wspólnoty gruntowej/:name/:id"}
  @resource "changes", {path: "zmiany"}, ->
    @route "changesMap", {path: "mapa"}
    @resource "changesSearch", {path: "szukaj"}
    @route "changesList", {path: "wyniki"}
    @resource "changesObject", {path: "obiekt"}, ->
      @route "change", {path: "zmiana/:name/:id"}
  @resource "prints", {path: "wydruki"}, ->
    @resource "extracts", {path: "wypisy"}, ->
      @route "prg", {path: "wypis pełny z rejestru gruntów"}
      @route "urg", {path: "wypis uproszczony z rejestru gruntów"}
      @route "rb", {path: "wypis z rejestru budynków"}
      @route "kb", {path: "wypis z kartoteki budynków"}
      @route "rl", {path: "wypis z rejestru lokali"}
      @route "kl", {path: "wypis z kartoteki lokali"}
    @route "lotIndex", {path: "skorowidz działek"}
    @resource "entityIndexes", {path: "skorowidze danych podmiotowych"}, ->
      @route "entitiesIndex", {path: "wykaz podmiotów"}
      @route "possesionsIndex", {path: "wykaz władających"}
      @route "leasesIndex", {path: "wykaz dzierżawców"}
      @route "incorrectShares", {path: "błędne udziały"}
    @resource "rankings", {path: "wykazy i zestawienia"}, ->
      @route "landsIndex", {path: "wykaz gruntów"}
      @route "buildingsIndex", {path: "wykaz budynków"}
      @route "localsIndex", {path: "wykaz lokali"}
      @route "landsRanking", {path: "zestawienie gruntów"}
      @route "terrainRanking", {path: "zestawienie użytków"}
    @resource "changeNotification", {path: "zawiadomienie o zmianie"}, ->
      @route "standardNotification" , {path: "zawiadomienie standardowe"}
      @route "taxNotification" , {path: "zawiadomienie podatkowe"}
      @route "taxClassification" , {path: "klasyfikacja podatkowa użytków"}
    @route "changesApplicationReport", {path: "dziennik zgłoszeń zmian"}
    @route "customReport", {path: "raporty dowolne"}
