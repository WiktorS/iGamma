App.EgbilObjectTerrainCategoryModel = App.GammaObjectModel.extend
  _objectType: "terrainCategory"
  _objectName: null

  terrainCategoryKind: null
  terrainCategoryArea: null

  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
