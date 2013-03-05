App.EgbilObjectBuildingModel = App.EgbilObjectModel.extend
  _objectType: "building"
  _objectName: (-> @get "buildingName").property("buildingName")
  _objectDescription: (-> "JE #{@get "cadastralUnit"}, Obręb #{@get "precinct"}, ID #{@get "_objectName"}").property("cadastralUnit", "precinct", "_objectName")
  _internalMaps: (->
    {
      lots: App.EgbilObjectLotModel
      addresses: App.EgbilObjectAddressModel
      documents: App.EgbilObjectDocumentModel
      locals: App.EgbilObjectLocalModel
    }
    ).property()

  check: null
  show: null
  marker: null
  buildingIDBinding: "id"
  buildingName: null
  jrbID: null
  jrbName: null
  jrgID: null
  jrgName: null
  jrgType: null
  precinct: null
  sheet: null
  cadastralUnit: null
  lots: null
  buildingArea: null
  usableArea: null
  buildingStatus: null
  buildingClass: null
  highestLevel: null
  lowestLevel: null
  numberOfLevels: null
  addresses: null
  documents: null
  constructionFinishDate: null
  constructionFinishDateCertainty: null
  reconstructionFinishDate: null
  reconstructionFinishDateCertainty: null
  reconstructionScope: null
  exteriorWallsMaterial: null
  buildingKind: null
  numberOfLocals: null
  monumentRegister: null
  cadastralValue: null
  valuationDate: null
  manyJRG: null
  remarks: null
  notes: null
  locals: null
