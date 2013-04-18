App.EntityIndexesController = Em.Controller.extend
  needs: ["gammaCache"]
  #input params
  content: null

  cadastralUnitList: null
  precinctListBinding: "content.precincts"
  precinctColumns: (-> App.Columns.getColumns([ "check", "name", "desc" ])).property()

  selectedCadastralUnit: null
  _selectedCadastralUnitChanged: (->
    @fillPrecinctList()
    ).observes("selectedCadastralUnit")

  type: (->
    router = @get "target"
    if router.isActive "entityIndexes.entitiesIndex" then "entities"
    else if router.isActive "entityIndexes.possesionsIndex" then "possesions"
    else if router.isActive "entityIndexes.leasesIndex" then "leases"
    else if router.isActive "entityIndexes.incorrectShares" then "incorrectShares"
    ).property("target.url")
  isEntities: (-> "entities" == @get "type").property("type")
  isManaging: (-> "possesions" == @get "type").property("type")

  init: ->
    @_super()
    @fillCadastralUnitList()

  fillPrecinctList: ->
    selectedCadastralUnitPrecincts = @get "selectedCadastralUnit.precincts"
    @set "precinctList", selectedCadastralUnitPrecincts

  fillCadastralUnitList: ->
    cache = @get "controllers.gammaCache"
    cache.getCadastralUnits =>
      @set "cadastralUnitList", cache.get "cadastralUnits"
      # first element is selected by default but we force selection of first item to trigger event
      @set "selectedCadastralUnit", @get "cadastralUnitList.0"

  fetchDataCallback: (fetchQueue, type) ->
    cache = @get "controllers.gammaCache"
    idList = Em.makeArray(fetchQueue).map (x) -> x.get "id"
    cache.getPrecincts idList, =>
      cachePrecincts = cache.get "precincts"
      for precinct in fetchQueue
        cached = cachePrecincts.find (x) -> precinct.get("id") == x.get "id"
        if cached?
          for own key,value of cached
            precinct.set key, value
          precinct.set "_dataStatus", App.GammaObjectStatus.READY
