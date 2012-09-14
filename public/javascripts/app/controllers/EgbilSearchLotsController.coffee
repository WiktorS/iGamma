App.EgbilSearchLotsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getLotsByNumber"
  title: "Działki"
  columns: [
    "check"
    "show"
    "marker"
    "lotNumber"
    "precinct"
    "cadastralSheet"
    "cadastralUnit"
    "jrgNumber"
    "address"
    "document"
    "cadastralArea"
  ]
