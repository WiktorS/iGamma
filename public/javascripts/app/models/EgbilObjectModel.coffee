App.EgbilObjectModel = Em.Object.extend
  attributes: null
  registerUnit: null
  shares: null
  lots: null
  buildings: null
  locals: null
  changes: null

  init: ->
    @_super()
    @registerUnit = App.EgbilObjectRegisterUnitModel.create()
    @document = App.EgbilObjectDocumentModel.create()
    @shares = Em.A()
    @lots = Em.A()
    @buildings = Em.A()
    @locals = Em.A()
    @changes = Em.A()


App.EgbilObjectRegisterUnitModel = Em.Object.extend
  show: null
  jrgNumber: null
  jrbNumber: null
  jrlNumber: null
  g5: null
  precinct: null
  cadastralUnit: null
  area: null
  kw: null
  creationProof: null
  creationDate: null
  householdType: null
  regon: null
  remarks: null
  notes: null

  init: ->
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowMapView
      sortable: false
    @jrgNumber = App.StandardTableCellModel.create
      label: "Numer JRG"
    @jrbNumber = App.StandardTableCellModel.create
      label: "Numer JRB"
    @jrlNumber = App.StandardTableCellModel.create
      label: "Numer JRL"
    @g5 = App.StandardTableCellModel.create
      label: "Identyfikator G5"
    @precinct = App.StandardTableCellModel.create
      label: "Obręb"
    @cadastralUnit = App.StandardTableCellModel.create
      label: "Jednostka ewidencyjna"
    @area = App.StandardTableCellModel.create
      label: "Pow. ewidencyjna"
    @kw = App.StandardTableCellModel.create
      label: "KW"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "kw"
    @creationProof = App.StandardTableCellModel.create
      label: "Dowód założenia"
    @creationDate = App.StandardTableCellModel.create
      label: "Data założenia"
    @householdType = App.StandardTableCellModel.create
      label: "Rodzaj gospodarstwa"
    @regon = App.StandardTableCellModel.create
      label: "REGON"
    @remarks = App.StandardTableCellModel.create
      label: "Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"


App.EgbilObjectDocumentModel = Em.Object.extend
  type: null
  sygnture: null
  source: null
  creationDate: null
  receiptDate: null
  description: null
  designation: null
  relatedType: null
  relatedSygnature: null

  init: ->
    @type = App.StandardTableCellModel.create
      label: "Rodzaj"
    @sygnature = App.StandardTableCellModel.create
      label: "Sygnatura"
    @source = App.StandardTableCellModel.create
      label: "Źródło"
    @creationDate = App.StandardTableCellModel.create
      label: "Data sporządzenia"
    @receiptDate = App.StandardTableCellModel.create
      label: "Data wpływu"
    @description = App.StandardTableCellModel.create
      label: "Opis"
    @designation = App.StandardTableCellModel.create
      label: "Oznaczenie"
    @relatedType = App.StandardTableCellModel.create
      label: "Rodzaj dokumentu związanego"
    @relatedSygnature = App.StandardTableCellModel.create
      label: "Sygnatura dokumentu związanego"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"


App.EgbilObjectShareModel = Em.Object.extend
  marker: null
  characterG: null
  characterB: null
  value: null
  registerGroupG: null
  registerGroupB: null
  groupType: null
  entity: null
  peselOrRegon: null
  address: null
  shareRemarks: null
  personRemarks: null

  init: ->
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @characterG = App.StandardTableCellModel.create
      label: "Charakter władania G"
    @characterB = App.StandardTableCellModel.create
      label: "Charakter władania B"
    @value = App.StandardTableCellModel.create
      label: "Udział"
    @registerGroupG = App.StandardTableCellModel.create
      label: "Grupa rejestrowa G"
    @registerGroupB = App.StandardTableCellModel.create
      label: "Grupa rejestrowa B"
    @groupType = App.StandardTableCellModel.create
      label: "Wyróżnik grupy"
      viewClass: App.EgbilListTableCellButtonView
      valueType: ""
    @entity = App.StandardTableCellModel.create
      label: "Podmiot"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "entity"
    @peselOrRegon = App.StandardTableCellModel.create
      label: "PESEL/REGON"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @shareRemarks = App.StandardTableCellModel.create
      label: "Udział. Uwagi"
    @personRemarks = App.StandardTableCellModel.create
      label: "Osoba. Uwagi"


App.EgbilObjectLotModel = Em.Object.extend
  show: null
  marker: null
  g5: null
  registeredArea: null
  geodesicArea: null
  addresses: null
  documentsSygnature: null
  terrainCategoryType: null
  terrainCategoryArea: null
  monumentRegister: null
  statisticalRegion: null
  listDistrict: null
  validFrom: null
  validTo: null
  value: null
  valuationDate: null
  remarks: null

  init: ->
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowMapView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @g5 = App.StandardTableCellModel.create
      label: "Identyfikator G5"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "g5"
    @registeredArea = App.StandardTableCellModel.create
      label: "Pow. ewidencyjna"
      help: "[ha]"
    @geodesicArea = App.StandardTableCellModel.create
      label: "Pow. geodezyjna"
      help: "[ha]"
    @addresses = App.StandardTableCellModel.create
      label: "Adresy"
    @documentsSygnature = App.StandardTableCellModel.create
      label: "Dokumenty/Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @terrainCategoryType = App.StandardTableCellModel.create
      label: "Klasoużytki/Rodzaj"
    @terrainCategoryArea = App.StandardTableCellModel.create
      label: "Klasoużytki/Powierzchnia"
      help: "[ha]"
    @monumentRegister = App.StandardTableCellModel.create
      label: "Rejestr zabytków"
    @statisticalRegion = App.StandardTableCellModel.create
      label: "Rejon statystyczny"
    @listDistrict = App.StandardTableCellModel.create
      label: "Obwód spisowy"
    @validFrom = App.StandardTableCellModel.create
      label: "Ważność od"
    @validTo = App.StandardTableCellModel.create
      label: "Ważność do"
    @value = App.StandardTableCellModel.create
      label: "Wartość"
    @valuationDate = App.StandardTableCellModel.create
      label: "Data wyceny"
    @remarks = App.StandardTableCellModel.create
      label: "Uwagi"


App.EgbilObjectBuildingModel = Em.Object.extend
  show: null
  marker: null
  g5: null
  jrbNumber: null
  documentsSygnature: null
  buildUpArea: null
  usableArea: null
  status: null
  type: null
  classType: null
  highestLevel: null
  lowestLevel: null
  addresses: null
  lotNumber: null
  lotArea: null
  constructionFinishDate: null
  reconstructionFinishDate: null
  reconstructionScope: null
  exterioWallsMaterial: null
  numberOfUnits: null
  monumentRegister: null
  cadastralValue: null
  valuationDate: null
  manyJRG: null
  remarks: null

  init: ->
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowMapView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @g5 = App.StandardTableCellModel.create
      label: "Identyfikator G5"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "g5"
    @jrbNumber = App.StandardTableCellModel.create
      label: "JRB"
    @documentsSygnature = App.StandardTableCellModel.create
      label: "Dokumenty/Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @buildUpArea = App.StandardTableCellModel.create
      label: "Powierzchnia zabudowy"
      help: "[m2]"
    @usableArea = App.StandardTableCellModel.create
      label: "Powierzchnia użytkowa "
      help: "[m2]"
    @status = App.StandardTableCellModel.create
      label: "Status"
    @type = App.StandardTableCellModel.create
      label: "Rodzaj"
    @classType = App.StandardTableCellModel.create
      label: "Klasa"
    @highestLevel = App.StandardTableCellModel.create
      label: "Nr najwyższej kondygn."
    @lowestLevel = App.StandardTableCellModel.create
      label: "Nr najniższej kondygn."
    @addresses = App.StandardTableCellModel.create
      label: "Adresy"
    @lotNumber = App.StandardTableCellModel.create
      label: "Działki/Numer"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "lot"
    @lotArea = App.StandardTableCellModel.create
      label: "Działki/Powierzchnia ewidencyjna"
    @constructionFinishDate = App.StandardTableCellModel.create
      label: "Data zakończenia budowy"
    @reconstructionFinishDate = App.StandardTableCellModel.create
      label: "Data zakończenia przebudowy"
    @reconstructionScope = App.StandardTableCellModel.create
      label: "Zakres przebudowy"
    @exterioWallsMaterial = App.StandardTableCellModel.create
      label: "Materiał ścian zewnętrznych"
    @numberOfUnits = App.StandardTableCellModel.create
      label: "Liczba wszystkich lokali"
    @monumentRegister = App.StandardTableCellModel.create
      label: "Rejestr zabytków"
    @cadastralValue = App.StandardTableCellModel.create
      label: "Wartość katastralna"
    @valuationDate = App.StandardTableCellModel.create
      label: "Data wyceny"
    @manyJRG = App.StandardTableCellModel.create
      label: "Wiele JRG"
    @remarks = App.StandardTableCellModel.create
      label: "Uwagi"


App.EgbilObjectLocalModel = Em.Object.extend
  show: null
  marker: null
  g5: null
  jrlNumber: null
  address: null
  documentsSygnature: null
  usableArea: null
  localType: null
  associatedPremisesBuilding: null
  associatedPremisesType: null
  associatedPremisesArea: null
  associatedPremisesNumber: null
  roomsNumber: null
  tier: null
  commonPropertyShare: null
  lot: null
  building: null
  cadastralValue: null
  valuationDate: null
  remarks: null

  init: ->
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowMapView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @g5 = App.StandardTableCellModel.create
      label: "Identyfikator G5"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "g5"
    @jrlNumber = App.StandardTableCellModel.create
      label: "JRL"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrl"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @documentsSygnature = App.StandardTableCellModel.create
      label: "Dokumenty/Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @usableArea = App.StandardTableCellModel.create
      label: "Powierzchnia użytkowa "
      help: "[m2]"
    @localType = App.StandardTableCellModel.create
      label: "Typ lokalu"
    @associatedPremisesBuilding = App.StandardTableCellModel.create
      label: "Pomieszczenia przynależne/Budynek"
    @associatedPremisesType = App.StandardTableCellModel.create
      label: "Pomieszczenia przynależne/Rodzaj"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "premises"
    @associatedPremisesArea = App.StandardTableCellModel.create
      label: "Pomieszczenia przynależne/Powierzchnia"
      help: "m2"
    @associatedPremisesNumber = App.StandardTableCellModel.create
      label: "Łączna powierzchnia pomieszczeń przynależnych"
    @roomsNumber = App.StandardTableCellModel.create
      label: "Liczba izb"
    @tier = App.StandardTableCellModel.create
      label: "Kondygnacja"
    @commonPropertyShare = App.StandardTableCellModel.create
      label: "Udział w nieruchomości wspólnej"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "propertyShare"
    @lot = App.StandardTableCellModel.create
      label: "Działka"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "lot"
    @building = App.StandardTableCellModel.create
      label: "Budynek"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "building"
    @cadastralValue = App.StandardTableCellModel.create
      label: "Wartość katastralna"
    @valuationDate = App.StandardTableCellModel.create
      label: "Data wyceny"
    @remarks = App.StandardTableCellModel.create
      label: "Uwagi"


App.EgbilObjectChangeModel = Em.Object.extend
  changeNumber: null
  registerDate: null
  entryDate: null
  type: null
  status: null
  description: null

  init: ->
    @changeNumber = App.StandardTableCellModel.create
      label: "Numer zmiany/numer kancelaryjny"
    @registerDate = App.StandardTableCellModel.create
      label: "Data rejestracji"
    @entryDate = App.StandardTableCellModel.create
      label: "Data wprowadzenia"
    @type = App.StandardTableCellModel.create
      label: "Rodzaj zmiany"
    @status = App.StandardTableCellModel.create
      label: "Status zmiany"
    @description = App.StandardTableCellModel.create
      label: "Opis zmiany"
