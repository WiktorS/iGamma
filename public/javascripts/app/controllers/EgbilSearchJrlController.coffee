App.EgbilSearchJrlController = App.EgbilSearchCommonController.extend
  jsonMethod: "getRegisterUnits"
  columns: [
    "check"
    "show"
    "marker"
    "jrlNumber"
    "precinct"
    "cadastralUnit"
    "creationProof"
    "creationDate"
  ]
  type: "jrl"
  title: "Jednostki Rejestrowe Lokali"
