App.EgbilObjectChangeModel = App.EgbilObjectModel.extend
  _objectType: "change"
  _objectName: (-> @get "changeName").property("changeName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
      documents: App.EgbilObjectDocumentModel
      lots: App.EgbilObjectLotModel
      members: App.EgbilObjectIntegraEntityModel
      registerUnits: App.EgbilObjectRegisterUnitModel
      registerUnitChanges: App.EgbilObjectRegisterUnitChangeModel
    }
    ).property()

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

  documents: null
  lots: null
  members: null
  registerUnits: null
  registerUnitChanges: null
