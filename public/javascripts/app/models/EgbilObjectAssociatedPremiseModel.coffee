App.EgbilObjectAssociatedPremiseModel = App.EgbilObjectModel.extend
  _objectType: ""
  _objectName: ""

  buildingID: null
  buildingName: null
  premiseKind: null
  premiseArea: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.EgbilObjectStatus.READY
