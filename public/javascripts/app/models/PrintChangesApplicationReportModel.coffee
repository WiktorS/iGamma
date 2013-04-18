App.PrintChangesApplicationReportModel = Em.Object.extend
  changeRegistered: null
  changeAccepted: null
  changeCanceled: null
  changeDenied: null
  printRegisterUnitList: null
  precinct: null
  filterDate: null
  filterDateFrom: null
  filterDateTo: null
  sort: null
  report: null
  description: null
  precincts: null

  init:->
    @_super()
    #init/default values
    @set "precincts", Em.A()
    @set "precinct", "registeredChanges"
    @set "filterDate", "register"
    @set "sort", "change"
    @set "report", "full"

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
