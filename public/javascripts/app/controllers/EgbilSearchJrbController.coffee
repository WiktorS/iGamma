App.EgbilSearchJrbController = App.EgbilSearchCommonController.extend
  jsonMethod: "getRegisterUnits"
  columns: [
    "check"
    "show"
    "marker"
    "jrbNumber"
    "precinct"
    "cadastralUnit"
    "creationProof"
    "creationDate"
  ]
  type: "jrb"
  title: "Jednostki Rejestrowe Budynków"
