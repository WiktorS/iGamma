App.EgbilSearchLocalsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getLocalByNumber"
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
  type: "locals"
  title: "Lokale"
