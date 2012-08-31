App.EgbilListModel = Em.Object.extend
  check: null
  show: null
  marker: null
  jrgNumber: null
  jrbNumber: null
  jrlNumber: null
  precinct: null
  cadastralUnit: null
  creationProof: null
  creationDate: null
  regon: null

  init: ->
    @_super()
    @check = App.StandardTableCellModel.create
      label: ""
      viewClass: App.EgbilListTableCellCheckBoxView
      sortable: false
    @show = App.StandardTableCellModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowView
      sortable: false
    @marker = App.StandardTableCellModel.create
      label: "Oznaczenie"
      viewClass: App.EgbilListTableCellMarkerView
    @jrgNumber = App.StandardTableCellModel.create
      label: "Numer JRG"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrg"
    @jrbNumber = App.StandardTableCellModel.create
      label: "Numer JRB"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrb"
    @jrlNumber = App.StandardTableCellModel.create
      label: "Numer JRL"
      viewClass: App.EgbilListTableCellButtonView
      valueType: "jrl"
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
