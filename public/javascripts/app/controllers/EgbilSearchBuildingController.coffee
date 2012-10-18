App.EgbilSearchBuildingController = App.EgbilSearchCommonController.extend
  jsonMethod: "getBuildingByNumber"
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
  type: "building"
  title: "Budynki"
