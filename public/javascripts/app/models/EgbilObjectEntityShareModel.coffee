App.EgbilObjectEntityShareModel = App.GammaObjectModel.extend
  _objectType: "entityShare"
  _objectName: null

  entityID: null
  entityType: null
  shareValue: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
