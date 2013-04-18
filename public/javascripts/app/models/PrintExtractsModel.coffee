App.PrintExtractsModel = Em.Object.extend
  sort: null
  number: null
  shareInfo: null
  noPersonalData: null
  noPESEL: null
  chosenShares: null
  otherCadastralUnitForPersons: null
  accounted: null
  noPendingChanges: null
  eachLotIndependent: null
  lotNotes: null
  chosenLots: null
  includeClauses: null
  state: null
  stateDay: null
  extractAndSketch: null
  simpleExtractForNeighboringLots: null
  buildingIndexExtract: null
  localIndexExtract: null
  localIndex: null
  extractNote: null
  extractNoteText: null
  lotAddresses: null
  terrainCategories: null
  eachBuidingIndependent: null
  buildingNotes: null
  chosenBuildings: null
  eachLocalIndependent: null
  localNotes: null
  chosenLocals: null
  fileFormat: null
  clauses: null
  lots: null
  buildings: null
  locals: null
  shares: null

  init:->
    @_super()
    #init/default values
    @set "clauses", Em.A()
    @set "lots", Em.A()
    @set "buildings", Em.A()
    @set "locals", Em.A()
    @set "shares", Em.A()
    @set "sort", "byLot"
    @set "state", "current"
    @set "localIndex", "chosenPerson"
    @set "fileFormat", "html"

  fetchClauses: (type) ->
    $.ajax
      url: "getPrintClauses.json"
      data:
        printType: type
      success: (data) =>
        if Em.isArray data
          clauses = @get "clauses"
          clauses.clear()
          clauses.addObject App.Common.toModel.call(App.PrintClauseModel, item) for item in data
          #save default clause text for allow value reset in UI
          item.set "clauseDefaultText", item.get("clauseText") for item in clauses
        return

  #function to provide model as data to send in form as params
  toParam: ->
    modelArrayTransform = (modelArray, mapping = {id: "id"})->
      for x in modelArray
        if !x.get "check"
          continue
        out = {}
        for key,value of mapping
          out[key] = x.get value
        out
    #special cases
    result = []
    result.addObject
      name: "clauses"
      value: modelArrayTransform(@get("clauses"), {id: "id", clauseText: "clauseText"})
    result.addObject
      name: "lots"
      value: modelArrayTransform @get("lots")
    result.addObject
      name: "buildings"
      value: modelArrayTransform @get("buildings")
    result.addObject
      name: "locals"
      value: modelArrayTransform @get("locals")
    result.addObject
      name: "shares"
      value: modelArrayTransform @get("shares")
    #general
    for own name of @
      if !(result.find (x) -> x.name == name)
        result.addObject {name: name, value: @get name}
    result
