App.EgbilListModel = Em.Object.extend
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
  jrgNumberJrgib: ( ->
    App.StandardTableCellModel.create
          label: "Numer JRG"
          viewClass: App.EgbilListTableCellButtonView
          valueType: "jrgib"
          displayValue: @get "jrgNumber.value"
          value: (=>
            [@get("jrgNumber.value"), @get("jrbNumber.value")].join(",").replace(/^,+|,+$/g, "")
          ).property()
    ).property("jrgNumber", "jrbNumber")
  jrbNumberJrgib: ( ->
    App.StandardTableCellModel.create
          label: "Numer JRB"
          valueType: "jrb"
          value: @get "jrbNumber.value"
    ).property("jrbNumber")

  init: ->
    @_super()
    @check = App.StandardTableCellModel.create
      label: ""
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
