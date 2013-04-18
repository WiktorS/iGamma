App.PrintsLotIndexController = Em.Controller.extend
  needs: ["gammaCache"]
  #input params
  content: null

  cadastralUnitList: null
  precinctList: null

  selectedCadastralUnit: null
  selectedPrecinct: null

  _selectedCadastralUnitChanged: (->
    @fillPrecinctList()
    ).observes("selectedCadastralUnit")
  _selectedPrecinctChanged: (->
    precincts = @get "content.precincts"
    precincts.clear()
    precincts.addObject @get "selectedPrecinct"
    ).observes("selectedPrecinct")

  init: ->
    @_super()
    @fillCadastralUnitList()

  fillPrecinctList: ->
    cache = @get "controllers.gammaCache"
    selectedCadastralUnitPrecincts = Em.makeArray(@get "selectedCadastralUnit.precincts")
    idList = selectedCadastralUnitPrecincts.map (x) -> x.get "id"
    cache.getPrecincts idList, =>
      cachePrecincts = cache.get "precincts"
      for precinct in selectedCadastralUnitPrecincts
        cached = cachePrecincts.find (x) -> precinct.get("id") == x.get "id"
        if cached?
          for own key,value of cached
            precinct.set key, value
          precinct.set "_dataStatus", App.GammaObjectStatus.READY
    @set "precinctList", selectedCadastralUnitPrecincts
    # first element is selected by default but we force selection of first item to trigger event
    @set "selectedPrecinct", @get "precinctList.0"

  fillCadastralUnitList: ->
    cache = @get "controllers.gammaCache"
    cache.getCadastralUnits =>
      @set "cadastralUnitList", cache.get "cadastralUnits"
      # first element is selected by default but we force selection of first item to trigger event
      @set "selectedCadastralUnit", @get "cadastralUnitList.0"
