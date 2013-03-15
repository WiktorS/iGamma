App.EgbilObjectInstitutionModel = App.GammaObjectModel.extend
  _objectType: "institution"
  _objectName: (-> @get "fullName").property("fullName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
      lots: App.EgbilObjectLotModel
      buildings: App.EgbilObjectBuildingModel
      locals: App.EgbilObjectLocalModel
      landCommunities: App.EgbilObjectLandCommunityModel
      lotsShare: App.EgbilObjectEntityShareModel
      buildingsShare: App.EgbilObjectEntityShareModel
      localsShare: App.EgbilObjectEntityShareModel
    }
    ).property()

  check: null
  institutionIDBinding: "id"
  institutionNameBinding: "fullName"
  fullName: null
  shortName: null
  status: null
  regon: null
  peselRegonBinding: "regon"
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
  landCommunities: null
  lotsShare: null
  buildingsShare: null
  localsShare: null
