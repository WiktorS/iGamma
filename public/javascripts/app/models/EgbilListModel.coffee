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
  number: null
  numberJRG: null
  cadastralSheet: null
  address: null
  document: null
  cadastralArea: null

  init: ->
    @_super()
    @check = App.StandardFilterElementModel.create
      label: ""
      viewClass: App.EgbilListTableCellCheckBoxView
    @show = App.StandardFilterElementModel.create
      label: "Pokaż"
      viewClass: App.EgbilListTableCellShowView
    @marker = App.StandardFilterElementModel.create
      label: "Oznaczenie"
    @jrgNumber = App.StandardFilterElementModel.create
      label: "Numer JRG"
    @jrbNumber = App.StandardFilterElementModel.create
      label: "Numer JRB"
    @jrlNumber = App.StandardFilterElementModel.create
      label: "Numer JRL"
    @precinct = App.StandardFilterElementModel.create
      label: "Obręb"
    @cadastralUnit = App.StandardFilterElementModel.create
      label: "Jednostka ewidencyjna"
    @creationProof = App.StandardFilterElementModel.create
      label: "Dowód założenia"
    @creationDate = App.StandardFilterElementModel.create
      label: "Data założenia"
    @regon = App.StandardFilterElementModel.create
      label: "REGON"
    @number= App.StandardFilterElementModel.create
      label: "Numer"
    @numberJRG= App.StandardFilterElementModel.create
      label: "Numer JRG"
    @cadastralSheet= App.StandardFilterElementModel.create
      label: "Arkusz ewidecyjny"
    @address= App.StandardFilterElementModel.create
      label: "Adres"
    @document= App.StandardFilterElementModel.create
      label: "Dokument"
    @cadastralArea= App.StandardFilterElementModel.create
      label: "Powierzchnia ewidencyjna"
