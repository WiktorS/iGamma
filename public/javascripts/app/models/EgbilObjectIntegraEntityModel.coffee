App.EgbilObjectIntegraEntityModel = App.GammaObjectModel.extend
  _objectTypeBinding: "entityType"
  _objectNameBinding: "entityName"

  entityIDBinding: "id"
  entityName: null
  entityType: null
  person: null
  institution: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
    #initialize possible entityTypes
    @set "person", App.EgbilObjectPersonModel.create()
    @set "institution", App.EgbilObjectInstitutionModel.create()
