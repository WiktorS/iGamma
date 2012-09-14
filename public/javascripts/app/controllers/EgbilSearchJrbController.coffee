App.EgbilSearchJrbController = App.EgbilSearchCommonController.extend
  jsonMethod: "getRegisterUnitsByJrb"
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
  title: "Jednostki Rejestrowe Budynków"
