App.PrintRankingsModel = Em.Object.extend
  scope: null
  area: null
  decimals: null
  saveSheet: null
  state: null
  stateDay: null
  precincts: null

  init:->
    @_super()
    #init/default values
    @set "precincts", Em.A()
    @set "decimals", "0"
    @set "scope", "full"
    @set "area", "urban"
    @set "state", "current"

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
      name: "precincts"
      value: modelArrayTransform @get("precincts")
    #general
    for own name of @
      if !(result.find (x) -> x.name == name)
        result.addObject {name: name, value: @get name}
    result
