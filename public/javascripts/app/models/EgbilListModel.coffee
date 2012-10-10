App.EgbilListModel = Em.Object.extend
  isCheckedBinding: "check.value"
  check: null
  show: null
  marker: null
  jrbNumber: null
  jrlNumber: null
  jrgNumber: null
  precinct: null
  cadastralUnit: null
  creationProof: null
  creationDate: null
  regon: null
  lotNumber: null
  cadastralSheet: null
  address: null
  document: null
  cadastralArea: null
  buildingNumber: null
  type: null
  finishYear: null
  buildUpArea: null
  usableArea: null
  localNumber: null
  surnameAndNames: null
  pesel: null
  identityDoc: null
  name: null
  nip: null
  #dokumenty
  sygnature: null
  scan: null
  lots: null
  buildings: null
  locals: null
  changes: null

  jrgNumberJrgib: ( ->
    App.StandardTableCellModel.create
          label: "Numer JRG"
          viewClass: App.EgbilListTableCellButtonView
          valueType: "jrgib"
          displayValue: @get "jrgNumber.value"
          value: [@get("jrgNumber.value"), @get("jrbNumber.value")].join(",").replace(/^,+|,+$/g, "")
    ).property("jrgNumber", "jrbNumber")
  jrbNumberJrgib: ( ->
    App.StandardTableCellModel.create
          label: "Numer JRB"
          valueType: "jrb"
          value: @get "jrbNumber.value"
    ).property("jrbNumber")

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
    @jrbNumber = App.StandardTableCellModel.create
      label: "Numer JRB"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrb"
    @jrlNumber = App.StandardTableCellModel.create
      label: "Numer JRL"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrl"
    @jrgNumber = App.StandardTableCellModel.create
      label: "Numer JRG"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrg"
    @precinct = App.StandardTableCellModel.create
      label: "Obręb"
    @cadastralUnit = App.StandardTableCellModel.create
      label: "Jednostka ewidencyjna"
    @creationProof = App.StandardTableCellModel.create
      label: "Dowód założenia"
    @creationDate = App.StandardTableCellModel.create
      label: "Data założenia"
    @regon = App.StandardTableCellModel.create
      label: "REGON"
    @lotNumber = App.StandardTableCellModel.create
      label: "Numer działki"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "lot"
    @cadastralSheet = App.StandardTableCellModel.create
      label: "Arkusz ewidecyjny"
    @address = App.StandardTableCellModel.create
      label: "Adres"
    @document = App.StandardTableCellModel.create
      label: "Dokument/sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @cadastralArea = App.StandardTableCellModel.create
      label: "Powierzchnia ewidencyjna [ha]"
    @buildingNumber = App.StandardTableCellModel.create
      label: "Numer budynku"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "build_number"
    @finishYear = App.StandardTableCellModel.create
      label: "Rok zakończenia budowy"
    @type = App.StandardTableCellModel.create
      label: "Rodzaj"
    @buildUpArea = App.StandardTableCellModel.create
      label: "Powierzchnia zabudowy [m2]"
    @usableArea = App.StandardTableCellModel.create
      label: "Powierzchnia użytkowa [m2]"
    @localNumber = App.StandardTableCellModel.create
      label: "Numer ewidencyjny"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "evid_number"
    @surnameAndNames = App.StandardTableCellModel.create
      label: "Nazwisko i imiona"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "name"
    @pesel = App.StandardTableCellModel.create
      label: "PESEL"
    @identityDoc = App.StandardTableCellModel.create
      label: "Dokument tożsamości"
    @name = App.StandardTableCellModel.create
      label: "Nazwa pełna"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "fullname"
    @nip = App.StandardTableCellModel.create
      label: "NIP"
    #dokumenty
    @sygnature  = App.StandardTableCellModel.create
      label: "Sygnatura"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "doc"
    @scan = App.StandardTableCellModel.create
      label: "Skan"
    @lots = App.StandardTableCellModel.create
      label: "Działki"
    @buildings = App.StandardTableCellModel.create
      label: "Budynki"
    @locals = App.StandardTableCellModel.create
      label: "Lokale"
    @changes = App.StandardTableCellModel.create
      label: "Zmiany"