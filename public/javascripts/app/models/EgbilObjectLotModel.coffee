App.EgbilObjectLotModel = App.GammaObjectModel.extend
  _objectType: "lot"
  _objectName: (-> @get "lotName").property("lotName")
  _objectDescription: (-> "JE #{@get "cadastralUnit"}, Obręb #{@get "precinct"}, ID #{@get "_objectName"}").property("cadastralUnit", "precinct", "_objectName")
  _internalMaps: (->
    {
      addresses: App.EgbilObjectAddressModel
      documents: App.EgbilObjectDocumentModel
      terrainCategories: App.EgbilObjectTerrainCategoryModel
      shares: App.EgbilObjectShareModel
    }
    ).property()

  check: null
  show: null
  marker: null
  lotIDBinding: "id"
  lotName: null
  precinct: null
  sheet: null
  cadastralUnit: null
  jrgID: null
  jrgName: null
  jrgType: null
  cadastralArea: null
  geodesicArea: null
  addresses: null
  documents: null
  terrainCategories: null
  shares: null
  monumentRegister: null
  statisticalRegion: null
  listDistrict: null
  validFrom: null
  validTo: null
  cadastralValue: null
  valuationDate: null
  remarks: null
  notes: null
