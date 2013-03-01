App.columnsData = Em.Object.create
  getColumns: (columnsOrder) ->
    # returns array of items defined in last line
    for columnName in columnsOrder
      columnData = @get "#{columnName}"
      Em.assert "Column '#{columnName}' is not defined in columnData", columnData
      Em.Object.create
        name: columnName
        data: columnData

  check: App.StandardTableCellModel.create
    label: ""
    viewClass: "App.EgbilListTableCellCheckBoxView"
    sortable: false
  show: App.StandardTableCellModel.create
    label: "Pokaż"
    viewClass: "App.EgbilListTableCellShowMapView"
    sortable: false
  marker: App.StandardTableCellModel.create
    label: "Oznaczenie"
    viewClass: "App.EgbilListTableCellMarkerView"
  precinct: App.StandardTableCellModel.create
    label: "Obręb"
  sheet: App.StandardTableCellModel.create
    label: "Arkusz"
  cadastralUnit: App.StandardTableCellModel.create
    label: "Jednostka ewidencyjna"
  building: App.StandardTableCellModel.create
    label: "Numer budynku"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "building"
  lots: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.EgbilListTableCellListView"
    value: "lots"
    valueType: "lot"
  jrb: App.StandardTableCellModel.create
    label: "Number JRB"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrb"
  jrg: App.StandardTableCellModel.create
    label: "Numer JRG"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrg"
  jrl: App.StandardTableCellModel.create
    label: "Numer JRL"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrl"
  buildingArea: App.StandardTableCellModel.create
    label: "Powierzchnia zabudowy"
  usableArea: App.StandardTableCellModel.create
    label: "Powierzchnia użytkowa"
  buildingStatus: App.StandardTableCellModel.create
    label: "Status budynku"
  buildingKind: App.StandardTableCellModel.create
    label: "Typ budynku"
  buildingClass: App.StandardTableCellModel.create
    label: "Klasa budynku"
  highestLevel: App.StandardTableCellModel.create
    label: "Numer najwyższej kondygnacji"
  lowestLevel: App.StandardTableCellModel.create
    label: "Numer najniższej kondygnacji"
  numberOfLevels: App.StandardTableCellModel.create
    label: "Łączna liczba kondygnacji"
  numberOfLocals: App.StandardTableCellModel.create
    label: "Liczba wszystkich lokali"
  constructionFinishDate: App.StandardTableCellModel.create
    label: "Data zakończenia budowy"
  constructionFinishDateCertainty: App.StandardTableCellModel.create
    label: "Stopień pewności ustalenia daty zakończenia budowy"
  reconstructionFinishDate: App.StandardTableCellModel.create
    label: "Data zakończenia przebudowy"
  reconstructionFinishDateCertainty: App.StandardTableCellModel.create
    label: "Stopień pewności ustalenia daty zakończenia przebudowy"
  reconstructionScope: App.StandardTableCellModel.create
    label: "Zakres przebudowy"
  exteriorWallsMaterial: App.StandardTableCellModel.create
    label: "Materiał ścian zewnętrznych"
  monumentRegister: App.StandardTableCellModel.create
    label: "Rejestr zabytków"
  manyJRG: App.StandardTableCellModel.create
    label: "Wiele JRG"
  remarks: App.StandardTableCellModel.create
    label: "Uwagi"
  notes: App.StandardTableCellModel.create
    label: "Notatki"
  address: App.StandardTableCellModel.create
    label: "Adres"
    viewClass: "App.EgbilListTableCellValueView"
    valueType: "address"
  local: App.StandardTableCellModel.create
    label: "Numer ewidencyjny"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "local"
  geodesicArea: App.StandardTableCellModel.create
    label: "Powierzchnia geodezyjna"
  listDistrict: App.StandardTableCellModel.create
    label: "Obwód spisowy"
  validFrom: App.StandardTableCellModel.create
    label: "Ważność od"
  validTo: App.StandardTableCellModel.create
    label: "Ważność do"
  addresses: App.StandardTableCellModel.create
    label: "Adresy"
    viewClass: "App.EgbilListTableCellListView"
    value: "addresses"
    valueType: "address"
  documentKind: App. StandardTableCellModel.create
    label: "Rodzaj dokumentu"
  documentSygnature: App. StandardTableCellModel.create
    label: "Sygnatura dokumentu"
  lot: App.StandardTableCellModel.create
    label: "Numer działki"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "lot"
  documents: App.StandardTableCellModel.create
    label: "Dokumenty"
    viewClass: "App.EgbilListTableCellListView"
    value: "documents"
    valueType: "document"
  cadastralArea: App.StandardTableCellModel.create
    label: "Powierzchnia ewidencyjna"
  statisticalRegion: App.StandardTableCellModel.create
    label: "Rejon statystyczny"
  terrainCategory: App.StandardTableCellModel.create
    label: "Klasoużytki"
    viewClass: "App.EgbilListTableCellSubTableView"
    value: "terrainCategories"
    columns: (=> App.get("columnsData").getColumns ["terrainCategoryKind", "terrainCategoryArea"]).property()
  terrainCategoryKind: App.StandardTableCellModel.create
    label: "Rodzaj"
  terrainCategoryArea: App.StandardTableCellModel.create
    label: "Powierzchnia"
  characterB: App.StandardTableCellModel.create
    label: "Charakter władania B"
  characterG: App.StandardTableCellModel.create
    label: "Charakter władania G"
  shareValue: App.StandardTableCellModel.create
    label: "Udział"
  registerGroupB: App.StandardTableCellModel.create
    label: "Grupa rejestrowa B"
  registerGroupG: App.StandardTableCellModel.create
    label: "Grupa rejestrowa G"
  groupKind: App.StandardTableCellModel.create
    label: "Wyróżnik grupy"
    viewClass: "App.EgbilListTableCellGroupKindView"  #TODO
  entity: App.StandardTableCellModel.create
    label: "Podmiot"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "entity"
  peselRegon: App.StandardTableCellModel.create
    label: "Numer PESEL/REGON"
  shareRemarks: App.StandardTableCellModel.create
    label: "Udział. Uwagi"
  personRemarks: App.StandardTableCellModel.create
    label: "Osoba. Uwagi"
  localKind: App.StandardTableCellModel.create
    label: "Typ lokalu"
  roomsNumber: App.StandardTableCellModel.create
    label: "Liczba izb"
  localLevel: App.StandardTableCellModel.create
    label: "Kondygnacja"
  commonPropertyShare: App.StandardTableCellModel.create
    label: "Udział w nieruchomości wspólnej"
  premiseKind: App.StandardTableCellModel.create
    label: "Rodzaj"
  premiseArea: App.StandardTableCellModel.create
    label: "Powierzchnia"
  shareG: App.StandardTableCellModel.create
    label: "Udział w gruncie"
  shareB: App.StandardTableCellModel.create
    label: "Udział w budynku"
  shareL: App.StandardTableCellModel.create
    label: "Udział w lokalu"
  #person
  person: App.StandardTableCellModel.create
    label: "Nazwisko Imiona (Imiona rodziców)"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "person"
  pesel: App.StandardTableCellModel.create
    label: "PESEL"
  surname: App.StandardTableCellModel.create
    label: "Nazwisko"
  firstName: App.StandardTableCellModel.create
    label: "Pierwsze imię"
  secondName: App.StandardTableCellModel.create
    label: "Drugie imię"
  sex: App.StandardTableCellModel.create
    label: "Płeć"
  fatherName: App.StandardTableCellModel.create
    label: "Imię ojca"
  motherName: App.StandardTableCellModel.create
    label: "Imię matki"
  citizenship: App.StandardTableCellModel.create
    label: "Obywatelstwo"
  status: App.StandardTableCellModel.create
    label: "Status podmiotu"
  nip: App.StandardTableCellModel.create
    label: "Numer NIP"
  identityDocument: App.StandardTableCellModel.create
    label: "Oznaczenie dokumentu tożsamości"
  mailingAddress: App.StandardTableCellModel.create
    label: "Adres korespondencyjny"
    viewClass: "App.EgbilListTableCellButtonView"
    value: "mailingAddressID"
    valueType: "address"
    valueName: "mailingAddressName"
  alive: App.StandardTableCellModel.create
    label: "Żyje"
  personKind: App.StandardTableCellModel.create
    label: "Rodzaj osoby"
    viewClass: "App.EgbilListTableCellListView" #TODO: Special class for this field
  lotShareCharacter: App.StandardTableCellModel.create
    label: "Charakter władania"
    viewClass: "App.EgbilListTableCellListView"
    value: "shares"
    valueName: "characterG"
  lotShareGroup: App.StandardTableCellModel.create
    label: "Grupa rejestrowa"
    viewClass: "App.EgbilListTableCellListView"
    value: "shares"
    valueName: "registerGroupG"
  lotShareValue: App.StandardTableCellModel.create
    label: "Udział"
    viewClass: "App.EgbilListTableCellListView"
    value: "shares"
    valueName: "shareValue"
  #institution
  institution: App.StandardTableCellModel.create
    label: "Nazwa pełna"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "institution"
  shortName: App.StandardTableCellModel.create
    label: "Nazwa skrócona"
  fullName: App.StandardTableCellModel.create
    label: "Nazwa pełna"
  registerName: App.StandardTableCellModel.create
    label: "Nazwa rejestru osób prawnych"
  registerNumber: App.StandardTableCellModel.create
    label: "Numer rejestru osób prawnych"
  registerCourt: App.StandardTableCellModel.create
    label: "Nazwa sądu rejestrowego"
  regon: App.StandardTableCellModel.create
    label: "Numer REGON"
  landCommunity: App.StandardTableCellModel.create
    label: "Nazwa spółki"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "landCommunity"
  landCommunityInstitution: App.StandardTableCellModel.create
    label: "Wspólnota gruntowa"
    viewClass: "App.EgbilListTableCellButtonView"
    value: "landCommunityInstitutionID"
    valueType: "institution"
    valueName: "landCommunityInstitutionName"
  #group
  group: App.StandardTableCellModel.create
    label: "Nazwa pełna"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "group"
  memberEntity: App.StandardTableCellModel.create
    label: "Nazwisko Imiona (Rodzice)/Nazwa pełna"
    viewClass: "App.EgbilListTableCellEntityView"
    valueName: "_objectName"
  memberAddress: App.StandardTableCellModel.create
    label: "Adres zamieszkania/Adres"
    viewClass: "App.EgbilListTableCellEntityView"
    valueName: "address"
  memberPeselRegon: App.StandardTableCellModel.create
    label: "PESEL/REGON"
    viewClass: "App.EgbilListTableCellEntityView"
    valueName: "peselRegon"
  memberNip: App.StandardTableCellModel.create
    label: "NIP"
    viewClass: "App.EgbilListTableCellEntityView"
    valueName: "nip"
  #document
  document: App.StandardTableCellModel.create
    label: "Sygnatura"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "document"
  documentType: App.StandardTableCellModel.create
    label: "Rodzaj"
  documentScan: App.StandardTableCellModel.create
    label: "Skan"
    viewClass: "App.EgbilListTableCellIsValueView"
    value: "scan"
  documentLots: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.EgbilListTableCellIsValueView"
    value: "lots"
  documentBuildings: App.StandardTableCellModel.create
    label: "Budynki"
    viewClass: "App.EgbilListTableCellIsValueView"
    value: "buildings"
  documentLocals: App.StandardTableCellModel.create
    label: "Lokale"
    viewClass: "App.EgbilListTableCellIsValueView"
    value: "locals"
  documentChanges: App.StandardTableCellModel.create
    label: "Zmiany"
    viewClass: "App.EgbilListTableCellIsValueView"
    value: "changes"
  documentSource: App.StandardTableCellModel.create
    label: "Źródło"
  creationDate: App.StandardTableCellModel.create
    label: "Data sporządzenia"
  receiptDate: App.StandardTableCellModel.create
    label: "Data wpływu"
  description: App.StandardTableCellModel.create
    label: "Opis"
  designation: App.StandardTableCellModel.create
    label: "Oznaczenie"
  relatedDocumentKind: App.StandardTableCellModel.create
    label: "Rodzaj dokumentu związanego"
  relatedDocument: App.StandardTableCellModel.create
    label: "Sygnatura dokumentu związanego"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "document"
    value: "relatedDocumentID"
    valueName: "relatedDocumentName"

  #change
  change: App.StandardTableCellModel.create
    label: "Numer zmiany"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "change"
  changeYear: App.StandardTableCellModel.create
    label: "Rok zmiany"
  applicationYear: App.StandardTableCellModel.create
    label: "Rok zgłoszenia"
  changeKind: App.StandardTableCellModel.create
    label: "Rodzaj zmiany"
  changeStatus: App.StandardTableCellModel.create
    label: "Status zmiany"
  changeDescription: App.StandardTableCellModel.create
    label: "Opis zmiany"

  #jr
  jrg: App.StandardTableCellModel.create
    label: "Numer JRG"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrg"
  jrb: App.StandardTableCellModel.create
    label: "Numer JRB"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrb"
  jrl: App.StandardTableCellModel.create
    label: "Numer JRL"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "jrl"
  oldJrg: App.StandardTableCellModel.create
    label: "Numer JRG"
    viewClass: "App.EgbilListTableCellButtonView"
    valueType: "oldJrg"
  landRegister: App.StandardTableCellModel.create
    label: "Księga Wieczysta"
  creationProof: App.StandardTableCellModel.create
    label: "Dowód założenia"
  creationDate: App.StandardTableCellModel.create
    label: "Data założenia"
  householdKind: App.StandardTableCellModel.create
    label: "Rodzaj gospodarstwa"

  cadastralValue: App.StandardTableCellModel.create
    label: "Wartość katastralna"
  valuationDate: App.StandardTableCellModel.create
    label: "Data wyceny"

  associatedPremises: App.StandardTableCellModel.create
    label: "Pomieszczenia przynależne"
    viewClass: "App.EgbilListTableCellSubTableView"
    value: "associatedPremises"
    columns: (=> App.get("columnsData").getColumns ["building", "premiseKind", "premiseArea"]).property()
  associatedPremisesAreaSum: App.StandardTableCellModel.create
    label: "Łączna powierzchnia pomieszczeń przynależnych"

  lotsJR: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.EgbilListTableCellSubTableView"
    value: "lots"
    valueType: "lot"
    columns: (=> App.get("columnsData").getColumns ["lot", "cadastralArea"]).property()

  shareGroup: App.StandardTableCellModel.create #oldJrg
    label: "Grupa rejestrowa"
