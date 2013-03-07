App.EgbilObjectRegisterUnitModel = App.EgbilObjectModel.extend
  # _objectType: (-> @get "registerUnitType").property("registerUnitType")
  _objectTypeBinding: "registerUnitType"
  _objectNameBinding: "registerUnitName"
  _objectDescription: (-> "JE #{@get "cadastralUnit"}, Obręb #{@get "precinct"}, ID #{@get "_objectName"}").property("cadastralUnit", "precinct", "_objectName")
  _internalMaps: (->
    {
      shares: App.EgbilObjectShareModel
      lots: App.EgbilObjectLotModel
      buildings: App.EgbilObjectBuildingModel
      locals: App.EgbilObjectLocalModel
    }
  ).property()

  check: null
  marker: null
  registerUnitIDBinding: "id"
  registerUnitName: (-> @get "#{@get "registerUnitType"}Name").property("registerUnitType")
  registerUnitType: null

  jrgID: null
  jrgName: null
  jrgTypeBinding: "registerUnitType"
  jrbID: null
  jrbName: null
  jrlID: null
  jrlName: null
  oldJrgNameBinding: "jrgName"  #needed to show objectName for oldJrg
  precinct: null
  cadastralUnit: null
  creationProof: null
  creationDate: null
  landRegister: null
  
  cadastralArea: null
  householdKind: null
  regon: null

  shareGroup: null

  shares: null
  lots: null
  buildings: null
  locals: null

  remarks: null
  notes: null
