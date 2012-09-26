App.EgbilSearchLocalsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getLocalByNumber"
  title: "Lokale"
  columns: [
    "check"
    "show"
    "marker"
    "localNumber"
    "address"
    "document"
    "precinct"
    "cadastralUnit"
    "jrgNumber"
    "jrlNumber"
    "usableArea"
    "lotNumber"
    "buildingNumber"
  ]

