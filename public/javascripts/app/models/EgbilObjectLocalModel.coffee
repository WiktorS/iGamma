App.EgbilObjectLocalModel = App.EgbilObjectModel.extend
  _objectType: "local"
  _objectName: (-> @get "localName").property("localName")
  _objectDescription: (-> "JE #{@get "cadastralUnit"}, Obręb #{@get "precinct"}, ID #{@get "_objectName"}").property("cadastralUnit", "precinct", "_objectName")
  _internalMaps: (->
    {
      documents: App.EgbilObjectDocumentModel
      associatedPremises: App.EgbilObjectAssociatedPremiseModel
      rights: App.EgbilObjectLocalRightModel
    }
    ).property()

  precinct: null
  cadastralUnit: null
  localIDBinding: "id"
  localName: null
  jrgID: null
  jrgName: null
  jrgType: null
  jrlID: null
  jrlName: null
  addressID: null
  addressName: null
  documents: null
  usableArea: null
  localKind: null
  localLevel: null
  associatedPremises: null
  associatedPremisesAreaSum: null
  roomsNumber: null
  commonPropertyShare: null
  lotID: null
  lotName: null
  buildingID: null
  buildingName: null
  cadastralValue: null
  valuationDate: null
  remarks: null
  notes: null
  rights: null