App.EgbilObjectLocalRightModel = App.EgbilObjectModel.extend
  _objectType: "localRight"
  _objectName: null

  entityID: null
  entityName: null
  addressID: null
  addressName: null
  shareG: null
  shareB: null
  shareL: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.EgbilObjectStatus.READY
