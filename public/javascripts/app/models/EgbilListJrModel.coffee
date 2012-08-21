App.EgbilListJrModel = Em.Object.extend
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
