App.EgbilObjectMemberModel = App.GammaObjectModel.extend
  _objectType: "member"
  _objectName: (-> "entityName").property("entityName")

  entityID: null
  entityName: null
  entityType: null
  addressID: null
  addressName: null
  peselRegon: null
  nip: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
