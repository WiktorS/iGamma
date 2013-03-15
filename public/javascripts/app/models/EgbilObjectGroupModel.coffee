App.EgbilObjectGroupModel = App.GammaObjectModel.extend
  _objectType: "group"
  _objectName: (-> @get "fullName").property("fullName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
      lots: App.EgbilObjectLotModel
      buildings: App.EgbilObjectBuildingModel
      locals: App.EgbilObjectLocalModel
      members: App.EgbilObjectIntegraEntityModel
      lotsShare: App.EgbilObjectEntityShareModel
      buildingsShare: App.EgbilObjectEntityShareModel
      localsShare: App.EgbilObjectEntityShareModel
    }
    ).property()

  check: null
  groupIDBinding: "id"
  groupNameBinding: "fullName"
  fullName: null
  shortName: null
  status: null
  regon: null
  nip: null
  addressID: null
  addressName: null
  registerName: null
  registerNumber: null
  registerCourt: null
  remarks: null
  notes: null
  lots: null
  buildings: null
  locals: null
  members: null
  lotsShare: null
  buildingsShare: null
  localsShare: null
