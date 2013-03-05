App.EgbilObjectChangeModel = App.EgbilObjectModel.extend
  _objectType: "change"
  _objectName: (-> @get "changeName").property("changeName")
#  _internalMaps: (->
#    {
#      addresses: App.EgbilObjectAddressModel
#      documents: App.EgbilObjectDocumentModel
#      terrainCategories: App.EgbilObjectTerrainCategoryModel
#      shares: App.EgbilObjectShareModel
#    }
#    ).property()

  check: null
  show: null
  marker: null

  changeIDBinding: "id"
  changeName: null
  systematics: null
  changeYear: null
  applicationYear: null
  applicationNumber: null
  stockKerg: null
  applicationKind: null
  changeKind: null
  changeStatus: null
  changeDescription: null
  lotsAndLandRegister: null
  applicationEntityID: null
  applicationEntityName: null
  applicationEntityType: null
  remarks: null
  notes: null
  registeredBy: null
  introducedBy: null
  acceptedBy: null
