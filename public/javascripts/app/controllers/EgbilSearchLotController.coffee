App.EgbilSearchLotController = App.EgbilSearchCommonController.extend
  jsonMethod: "getLotsByNumber"
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
  type: "lot"
  title: "Działki"
