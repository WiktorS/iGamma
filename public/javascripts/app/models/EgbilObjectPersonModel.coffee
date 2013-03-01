App.EgbilObjectPersonModel = App.EgbilObjectModel.extend
  _objectType: "person"
  _objectName: (-> @get "personName").property("personName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
      lots: App.EgbilObjectLotModel
      buildings: App.EgbilObjectBuildingModel
      locals: App.EgbilObjectLocalModel
      lotsShare: App.EgbilObjectEntityShareModel
      buildingsShare: App.EgbilObjectEntityShareModel
      localsShare: App.EgbilObjectEntityShareModel
    }
    ).property()


  check: null
  personIDBinding: "id"
  personName: (->
    fatherName = @get "fatherName"
    motherName = @get "motherName"
    parents = "(#{[fatherName, motherName].join(", ")})" if fatherName || motherName
    [@get("surname"), @get("firstName"), @get("secondName"), parents].join(" ")
    ).property("surname", "firstName", "secondName", "fatherName", "motherName")
  pesel: null
  surname: null
  firstName: null
  secondName: null
  sex: null
  fatherName: null
  motherName: null
  citizenship: null
  status: null
  nip: null
  identityDocument: null
  addressID: null
  addressName: null
  mailingAddressID: null
  mailingAddressName: null
  alive: null
  remarks: null
  notes: null
  lots: null
  buildings: null
  locals: null
  lotsShare: null
  buildingsShare: null
  localsShare: null