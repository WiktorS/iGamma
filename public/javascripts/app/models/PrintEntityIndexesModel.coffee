App.PrintEntityIndexesModel = Em.Object.extend
  state: null
  stateDay: null
  alphabeticalTable: null
  onlyManagingGovernmentLand: null
  precincts: null

  init: ->
    @_super()
    #init/default values
    @set "precincts", Em.A()
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
