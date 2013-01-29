App.EgbilObjectModel = Em.Object.extend
  attributes: null
  registerUnit: null
  lot: null
  building: null
  shares: null
  lots: null
  buildings: null
  locals: null
  changes: null
  documents: null
  useClasses: null
  premises: null

  init: ->
    @_super()
    @registerUnit = App.EgbilObjectRegisterUnitModel.create()
    @person = App.EgbilObjectPersonModel.create()
    @institution = App.EgbilObjectInstitutionModel.create()
    @document = App.EgbilObjectDocumentModel.create()
    @lot = App.EgbilObjectLotModel.create()
    @building = App.EgbilObjectBuildingModel.create()
    @local= App.EgbilObjectLocalModel.create()
    @shares = Em.A()
    @lots = Em.A()
    @buildings = Em.A()
    @locals = Em.A()
    @changes = Em.A()
    @documents = Em.A()
    @useClasses = Em.A()
    @premises = Em.A()


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


App.EgbilObjectPersonModel = Em.Object.extend
  pesel: null
  surname: null
  firstname: null
  secondname: null
  sex: null
  fathername: null
  mothername: null
  nationality: null
  status: null
  nip: null
  document: null
  address: null
  mailaddress: null
  alive: null
  remarks: null
  notes: null

  init: ->
    @pesel = App.StandardTableCellModel.create
      label: "PESEL"
    @surname = App.StandardTableCellModel.create
      label: "Nazwisko"
    @firstname = App.StandardTableCellModel.create
      label: "Pierwsze imię"
    @secondname = App.StandardTableCellModel.create
      label: "Drugie imię"
    @sex = App.StandardTableCellModel.create
      label: "Płeć"
    @fathername = App.StandardTableCellModel.create
      label: "Imię ojca"
    @mothername = App.StandardTableCellModel.create
      label: "Imię matki"
    @nationality = App.StandardTableCellModel.create
      label: "Obywatelstwo"
    @status = App.StandardTableCellModel.create
      label: "Status podmiotu"
    @nip = App.StandardTableCellModel.create
      label: "NIP"
    @document = App.StandardTableCellModel.create
      label: "Oznaczenie dokumentu"
    @address = App.StandardTableCellModel.create
      label: "Adres zamieszkania"
    @mailaddress = App.StandardTableCellModel.create
      label: "Adres korespondencyjny"
    @alive = App.StandardTableCellModel.create
      label: "Żyje"
    @remarks = App.StandardTableCellModel.create
      label: "_Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"



App.EgbilObjectInstitutionModel = Em.Object.extend
  fullname: null
  shortname: null
  status: null
  regon: null
  nip: null
  address: null
  registername: null
  registernumber: null
  registercourt: null
  remarks: null
  notes: null

  init: ->
    @fullname = App.StandardTableCellModel.create
      label: "Nazwa pełna"
    @shortname = App.StandardTableCellModel.create
      label: "Nazwa skrócona"
    @status = App.StandardTableCellModel.create
      label: "Status podmiotu"
    @regon = App.StandardTableCellModel.create
      label: "REGON"
    @nip = App.StandardTableCellModel.create
      label: "NIP"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @registername = App.StandardTableCellModel.create
      label: "Nazwa rejestru osób prawnych"
    @registernumber = App.StandardTableCellModel.create
      label: "Numer rejestru osób prawnych"
    @registercourt = App.StandardTableCellModel.create
      label: "Nazwa sądu rejestrowego"
    @remarks = App.StandardTableCellModel.create
      label: "_Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"

App.EgbilObjectGroupModel = Em.Object.extend
  fullname: null
  shortname: null
  status: null
  regon: null
  nip: null
  address: null
  registername: null
  registernumber: null
  registercourt: null
  remarks: null
  notes: null

  init: ->
    @fullname = App.StandardTableCellModel.create
      label: "Nazwa pełna"
    @shortname = App.StandardTableCellModel.create
      label: "Nazwa skrócona"
    @status = App.StandardTableCellModel.create
      label: "Status podmiotu"
    @regon = App.StandardTableCellModel.create
      label: "REGON"
    @nip = App.StandardTableCellModel.create
      label: "NIP"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @registername = App.StandardTableCellModel.create
      label: "Nazwa rejestru osób prawnych"
    @registernumber = App.StandardTableCellModel.create
      label: "Numer rejestru osób prawnych"
    @registercourt = App.StandardTableCellModel.create
      label: "Nazwa sądu rejestrowego"
    @remarks = App.StandardTableCellModel.create
      label: "_Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"

App.EgbilObjectLandCommunityModel = Em.Object.extend
  name: null
  status: null
  address: null
  landCommunity: null
  remarks: null
  notes: null

  init: ->
    @name = App.StandardTableCellModel.create
      label: "Nazwa spółki"
    @status = App.StandardTableCellModel.create
      label: "Status podmiotu"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @landCommunity = App.StandardTableCellModel.create
      label: "Wspólnota gruntowa"
    @remarks = App.StandardTableCellModel.create
      label: "_Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"

App.EgbilObjectLandCommunitiesModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  marker: null
  name: null
  address: null
  landCommunity: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @name = App.StandardTableCellModel.create
      label: "Nazwa spółki"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @landCommunity = App.StandardTableCellModel.create
      label: "Wspólnota gruntowa"

App.EgbilObjectMemberModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  marker: null
  type: null
  surnameAndNames: null
  pesel: null
  nip: null
  address: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @type = App.StandardTableCellModel.create
      label: "Rodzaj osoby"
    @surnameAndNames = App.StandardTableCellModel.create
      label: "Nazwisko Imiona (Rodzice)/Nazwa pełna"
    @pesel = App.StandardTableCellModel.create
      label: "PESEL/REGON"
    @nip = App.StandardTableCellModel.create
      label: "NIP"
    @address = App.StandardTableCellModel.create
      label: "Adres"

App.EgbilObjectDocumentModel = Em.Object.extend
  type: null
  sygnature: null
  source: null
  creationDate: null
  receiptDate: null
  description: null
  designation: null
  relatedType: null
  relatedSygnature: null
  locals: null

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
    @locals = App.StandardTableCellModel.create
      label: "Lokale"


App.EgbilObjectShareModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
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
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
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
  isCheckedBinding: "check.value"
  check: null
  show: null
  marker: null
  precinct: null
  lotNumber: null
  g5: null
  registeredArea: null
  geodesicArea: null
  addresses: null
  documentsSygnature: null
  useClassType: null
  useClassArea: null
  monumentRegister: null
  statisticalRegion: null
  listDistrict: null
  validFrom: null
  validTo: null
  value: null
  valuationDate: null
  remarks: null
  notes: null
  jrgNumber: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowMapView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @precinct = App.StandardTableCellModel.create
      label: "Systematyka"
    @lotNumber = App.StandardTableCellModel.create
      label: "Numer"
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
    @useClassType = App.StandardTableCellModel.create
      label: "Klasoużytki/Rodzaj"
    @useClassArea = App.StandardTableCellModel.create
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
    @notes = App.StandardTableCellModel.create
      label: "Notatki"
    @jrgNumber = App.StandardTableCellModel.create
      label: "JRG"


App.EgbilObjectBuildingModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  show: null
  marker: null
  g5: null
  precinct: null
  buildingNumber: null
  jrgNumber: null
  jrbNumber: null
  documentsSygnature: null
  buildUpArea: null
  usableArea: null
  status: null
  type: null
  classType: null
  highestLevel: null
  lowestLevel: null
  numberOfLevels: null
  addresses: null
  lotNumber: null
  lotArea: null
  lots: null
  documents: null
  constructionFinishDate: null
  constructionFinishDateCertainty: null
  reconstructionFinishDate: null
  reconstructionFinishDateCertainty: null
  reconstructionScope: null
  exteriorWallsMaterial: null
  numberOfUnits: null
  monumentRegister: null
  cadastralValue: null
  valuationDate: null
  manyJRG: null
  remarks: null
  notes: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
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
    @precinct = App.StandardTableCellModel.create
      label: "Systematyka"
    @buildingNumber = App.StandardTableCellModel.create
      label: "Numer"
    @jrgNumber = App.StandardTableCellModel.create
      label: "JRG"
    @jrbNumber = App.StandardTableCellModel.create
      label: "JRB"
    @documentsSygnature = App.StandardTableCellModel.create
      label: "Dokumenty/Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @buildUpArea = App.StandardTableCellModel.create
      label: "Powierzchnia zabudowy [m2]"
      help: "[m2]"
    @usableArea = App.StandardTableCellModel.create
      label: "Powierzchnia użytkowa [m2]"
      help: "[m2]"
    @status = App.StandardTableCellModel.create
      label: "Status budynku"
    @type = App.StandardTableCellModel.create
      label: "Rodzaj budynku"
    @classType = App.StandardTableCellModel.create
      label: "Klasa budynku"
    @highestLevel = App.StandardTableCellModel.create
      label: "Nr najwyższej kondygn."
    @lowestLevel = App.StandardTableCellModel.create
      label: "Nr najniższej kondygn."
    @numberOfLevels = App.StandardTableCellModel.create
      label: "Łączna liczba kondygnacji"
    @lots = App.StandardTableCellModel.create
      label: "Działki"
    @addresses = App.StandardTableCellModel.create
      label: "Adresy"
    @documents = App.StandardTableCellModel.create
      label: "Dokumenty"
    @locals = App.StandardTableCellModel.create
      label: "Lokale"
    @lotNumber = App.StandardTableCellModel.create
      label: "Działki/Numer"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "lot"
    @lotArea = App.StandardTableCellModel.create
      label: "Działki/Powierzchnia ewidencyjna"
    @constructionFinishDate = App.StandardTableCellModel.create
      label: "Data zakończenia budowy"
    @constructionFinishDateCertainty = App.StandardTableCellModel.create
      label: "Pewność daty zakończenia budowy"
    @reconstructionFinishDate = App.StandardTableCellModel.create
      label: "Data zakończenia przebudowy"
    @reconstructionFinishDateCertainty = App.StandardTableCellModel.create
      label: "Pewność daty zakończenia przebudowy"
    @reconstructionScope = App.StandardTableCellModel.create
      label: "Zakres przebudowy"
    @exteriorWallsMaterial = App.StandardTableCellModel.create
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
    @notes = App.StandardTableCellModel.create
      label: "Notatki"


App.EgbilObjectRightModel = Em.Object.extend
  entity: null
  address: null
  landShares: null
  buildingShares: null
  localShares: null

  init: ->
    @entity = App.StandardTableCellModel.create
      label: "Podmiot"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "entity"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @landShares = App.StandardTableCellModel.create
      label: "Udział w gruncie"
    @buildingShares = App.StandardTableCellModel.create
      label: "Udział w budynku"
    @localShares = App.StandardTableCellModel.create
      label: "Udział w lokalu"

App.EgbilObjectLocalModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  show: null
  marker: null
  g5: null
  precinct: null
  number: null
  jrgNumber: null
  jrlNumber: null
  address: null
  documentsSygnature: null
  usableArea: null
  type: null
  level: null
  associatedPremisesBuilding: null
  associatedPremisesType: null
  associatedPremisesArea: null
  associatedPremisesNumber: null
  roomsNumber: null
  tier: null
  commonPropertyShare: null
  lot: null
  building: null
  documents: null
  cadastralValue: null
  valuationDate: null
  remarks: null
  notes: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
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
    @precinct = App.StandardTableCellModel.create
      label: "Systematyka"
    @number = App.StandardTableCellModel.create
      label: "Numer ewidencyjny"
    @jrgNumber = App.StandardTableCellModel.create
      label: "JRG"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrg"
    @jrlNumber = App.StandardTableCellModel.create
      label: "JRL"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrl"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @level = App.StandardTableCellModel.create
      label: "Kondygnacja"
    @documentsSygnature = App.StandardTableCellModel.create
      label: "Dokumenty/Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @usableArea = App.StandardTableCellModel.create
      label: "Powierzchnia użytkowa "
      help: "[m2]"
    @type = App.StandardTableCellModel.create
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
    @documents = App.StandardTableCellModel.create
      label: "Dokumenty"
    @cadastralValue = App.StandardTableCellModel.create
      label: "Wartość katastralna"
    @valuationDate = App.StandardTableCellModel.create
      label: "Data wyceny"
    @remarks = App.StandardTableCellModel.create
      label: "Uwagi"
    @notes = App.StandardTableCellModel.create
      label: "Notatki"

App.EgbilObjectChangeModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  changeNumber: null
  registerDate: null
  entryDate: null
  type: null
  status: null
  description: null

  init: ->
    @_super()
    @set "check", App.StandardTableCellModel.create
      value: false
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
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

App.EgbilObjectUseClassModel = Em.Object.extend
  type: null
  area: null

  init: ->
    @type = App.StandardTableCellModel.create
      label: "Rodzaj"
    @area = App.StandardTableCellModel.create
      label: "Powierzchnia [ha]"

App.EgbilObjectPremiseModel = Em.Object.extend
  building: null
  type: null
  area: null

  init: ->
    @building = App.StandardTableCellModel.create
      label: "Budynek"
    @type = App.StandardTableCellModel.create
      label: "Rodzaj"
    @area = App.StandardTableCellModel.create
      label: "Powierzchnia [m2]"
