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
    viewClass: "App.GammaListTableCellCheckBoxView"
    sortable: false
  show: App.StandardTableCellModel.create
    label: "Pokaż"
    viewClass: "App.GammaListTableCellShowMapView"
    sortable: false
  marker: App.StandardTableCellModel.create
    label: "Oznaczenie"
    viewClass: "App.GammaListTableCellMarkerView"
  precinct: App.StandardTableCellModel.create
    label: "Obręb"
  sheet: App.StandardTableCellModel.create
    label: "Arkusz"
  cadastralUnit: App.StandardTableCellModel.create
    label: "Jednostka ewidencyjna"
  building: App.StandardTableCellModel.create
    label: "Numer budynku"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "building"
  lots: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.GammaListTableCellListView"
    value: "lots"
    valueType: "lot"
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
    viewClass: "App.GammaListTableCellValueView"
    valueType: "address"
  local: App.StandardTableCellModel.create
    label: "Numer ewidencyjny"
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellListView"
    value: "addresses"
    valueType: "addressName"
  documentKind: App. StandardTableCellModel.create
    label: "Rodzaj dokumentu"
  documentSygnature: App. StandardTableCellModel.create
    label: "Sygnatura dokumentu"
  lot: App.StandardTableCellModel.create
    label: "Numer działki"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "lot"
  documents: App.StandardTableCellModel.create
    label: "Dokumenty"
    viewClass: "App.GammaListTableCellListView"
    value: "documents"
    valueType: "document"
  cadastralArea: App.StandardTableCellModel.create
    label: "Powierzchnia ewidencyjna"
  statisticalRegion: App.StandardTableCellModel.create
    label: "Rejon statystyczny"
  terrainCategory: App.StandardTableCellModel.create
    label: "Klasoużytki"
    viewClass: "App.GammaListTableCellSubTableView"
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
    viewClass: "App.GammaListTableCellGroupKindView"
    value: "entity"
  entity: App.StandardTableCellModel.create
    label: "Podmiot"
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellButtonView"
    value: "mailingAddressID"
    valueType: "address"
    valueName: "mailingAddressName"
  alive: App.StandardTableCellModel.create
    label: "Żyje"
  lotPersonKind: App.StandardTableCellModel.create
    label: "Rodzaj osoby"
    viewClass: "App.GammaListTableCellPersonKindView"
    valueType: "lot"
  buildingPersonKind: App.StandardTableCellModel.create
    label: "Rodzaj osoby"
    viewClass: "App.GammaListTableCellPersonKindView"
    valueType: "building"
  localPersonKind: App.StandardTableCellModel.create
    label: "Rodzaj osoby"
    viewClass: "App.GammaListTableCellPersonKindView"
    valueType: "local"
  memberPersonKind: App.StandardTableCellModel.create
    label: "Rodzaj osoby"
    viewClass: "App.GammaListTableCellPersonKindView"
    valueType: "member"
  lotShareCharacter: App.StandardTableCellModel.create
    label: "Charakter władania"
    viewClass: "App.GammaListTableCellListView"
    value: "shares"
    valueName: "characterG"
  lotShareGroup: App.StandardTableCellModel.create
    label: "Grupa rejestrowa"
    viewClass: "App.GammaListTableCellListView"
    value: "shares"
    valueName: "registerGroupG"
  lotShareValue: App.StandardTableCellModel.create
    label: "Udział"
    viewClass: "App.GammaListTableCellListView"
    value: "shares"
    valueName: "shareValue"
  #institution
  institution: App.StandardTableCellModel.create
    label: "Nazwa pełna"
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "landCommunity"
  landCommunityInstitution: App.StandardTableCellModel.create
    label: "Wspólnota gruntowa"
    viewClass: "App.GammaListTableCellButtonView"
    value: "landCommunityInstitutionID"
    valueType: "institution"
    valueName: "landCommunityInstitutionName"
  #group
  group: App.StandardTableCellModel.create
    label: "Nazwa pełna"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "group"
  memberEntity: App.StandardTableCellModel.create
    label: "Nazwisko Imiona (Rodzice)/Nazwa pełna"
    viewClass: "App.GammaListTableCellMemberView"
    value: "entity"
    memberValue: "_objectName"
  memberAddress: App.StandardTableCellModel.create
    label: "Adres zamieszkania/Adres"
    viewClass: "App.GammaListTableCellMemberView"
    value: "entity"
    memberValue: "addressName"
  memberPeselRegon: App.StandardTableCellModel.create
    label: "PESEL/REGON"
    viewClass: "App.GammaListTableCellMemberView"
    value: "entity"
    memberValue: "peselRegon"
  memberNip: App.StandardTableCellModel.create
    label: "NIP"
    viewClass: "App.GammaListTableCellMemberView"
    value: "entity"
    memberValue: "nip"
  #document
  document: App.StandardTableCellModel.create
    label: "Sygnatura"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "document"
  documentType: App.StandardTableCellModel.create
    label: "Rodzaj"
  documentScan: App.StandardTableCellModel.create
    label: "Skan"
    viewClass: "App.GammaListTableCellIsValueView"
    value: "scan"
  documentLots: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.GammaListTableCellIsValueView"
    value: "lots"
  documentBuildings: App.StandardTableCellModel.create
    label: "Budynki"
    viewClass: "App.GammaListTableCellIsValueView"
    value: "buildings"
  documentLocals: App.StandardTableCellModel.create
    label: "Lokale"
    viewClass: "App.GammaListTableCellIsValueView"
    value: "locals"
  documentChanges: App.StandardTableCellModel.create
    label: "Zmiany"
    viewClass: "App.GammaListTableCellIsValueView"
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
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "document"
    value: "relatedDocumentID"
    valueName: "relatedDocumentName"

  #change
  change: App.StandardTableCellModel.create
    label: "Numer zmiany"
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "jrg"
  jrb: App.StandardTableCellModel.create
    label: "Numer JRB"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "jrb"
  jrl: App.StandardTableCellModel.create
    label: "Numer JRL"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "jrl"
  oldJrg: App.StandardTableCellModel.create
    label: "Numer JRG"
    viewClass: "App.GammaListTableCellButtonView"
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
    viewClass: "App.GammaListTableCellSubTableView"
    value: "associatedPremises"
    columns: (=> App.get("columnsData").getColumns ["building", "premiseKind", "premiseArea"]).property()
  associatedPremisesAreaSum: App.StandardTableCellModel.create
    label: "Łączna powierzchnia pomieszczeń przynależnych"

  lotsJR: App.StandardTableCellModel.create
    label: "Działki"
    viewClass: "App.GammaListTableCellSubTableView"
    value: "lots"
    valueType: "lot"
    columns: (=> App.get("columnsData").getColumns ["lot", "cadastralArea"]).property()

  shareGroup: App.StandardTableCellModel.create #oldJrg
    label: "Grupa rejestrowa"

  #change
  registerUnit: App.StandardTableCellModel.create
    label: "JR"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "registerUnit"
  registerUnitChangeBefore:
    label: "Numer przed zmianą"
    viewClass: "App.GammaListTableCellJRChangeView"
    value: "registerUnitChanges"
    valueName: "before"
  registerUnitChangeAfter:
    label: "Numer po zmianie"
    viewClass: "App.GammaListTableCellJRChangeView"
    value: "registerUnitChanges"
    valueName: "after"
  systematics: App.StandardTableCellModel.create
    label: "Systematyka"
  changeYear: App.StandardTableCellModel.create
    label: "Rok zmiany"
  changeName: App.StandardTableCellModel.create
    label: "Numer zmiany"
  applicationYear: App.StandardTableCellModel.create
    label: "Rok zgłoszenia"
  applicationNumber: App.StandardTableCellModel.create
    label: "Numer zgłoszenia"
  stockKerg: App.StandardTableCellModel.create
    label: "Numer zasobu lub KERG"
  applicationKind: App.StandardTableCellModel.create
    label: "Typ wniosku"
  changeKind: App.StandardTableCellModel.create
    label: "Rodzaj zmiany"
  changeStatus: App.StandardTableCellModel.create
    label: "Status zmiany"
  changeDescription: App.StandardTableCellModel.create
    label: "Opis zmiany"
  lotsAndLandRegister: App.StandardTableCellModel.create
    label: "Działki i KW"
  applicationEntity: App.StandardTableCellModel.create
    label: "Podmiot zgłaszający zmianę"
    viewClass: "App.GammaListTableCellButtonView"
    valueType: "applicationEntity"
  registeredBy: App.StandardTableCellModel.create
    label: "Zarejestrował"
  introducedBy: App.StandardTableCellModel.create
    label: "Wprowadził"
  acceptedBy: App.StandardTableCellModel.create
    label: "Zaakceptował"
