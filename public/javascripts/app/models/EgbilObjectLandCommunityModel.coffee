App.EgbilObjectLandCommunityModel = App.GammaObjectModel.extend
  _objectType: "landCommunity"
  _objectName: (-> @get "landCommunityName").property("landCommunityName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
     members: App.EgbilObjectIntegraEntityModel
    }
    ).property()


  check: null
  landCommunityIDBinding: "id"
  landCommunityName: null
  status: null
  addressID: null
  addressName: null
  landCommunityInstitutionID: null
  landCommunityInstitutionName: null
  remarks: null
  notes: null
  members: null
