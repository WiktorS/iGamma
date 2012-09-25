App.EgbilSearchBuildingsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getBuildingByNumber"
  title: "Budynki"
  columns: [
    "check"
    "show"
    "marker"
    "buildingNumber"
    "lotNumber"
    "precinct"
    "cadastralUnit"
    "jrgNumber"
    "jrbNumber"
    "type"
    "finishYear"
    "buildUpArea"
  ]