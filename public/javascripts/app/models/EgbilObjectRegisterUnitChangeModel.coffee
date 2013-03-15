App.EgbilObjectRegisterUnitChangeModel = App.GammaObjectModel.extend
  _objectTypeBinding: "registerUnitType"
  _objectName: null

  registerUnitIDBinding: "id"
  registerUnitType: null

  before: null
  after: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
