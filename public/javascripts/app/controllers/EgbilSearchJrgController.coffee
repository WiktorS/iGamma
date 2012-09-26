App.EgbilSearchJrgController = App.EgbilSearchCommonController.extend
  jsonMethod: "getRegisterUnitsByJrg"
  columns: [
    "check"
    "show"
    "marker"
    "jrgNumber"
    "precinct"
    "cadastralUnit"
    "creationProof"
    "creationDate"
  ]
  title: "Stare Jednostki Rejestrowe Gruntów"
