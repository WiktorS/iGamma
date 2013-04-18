App.PrintCustomReportModel = Em.Object.extend
  attributes: null
  configurations: null
  attributeLegend: null
  lineBreak: null
  fileFormat: null

  init: ->
    @set "attributes", [] if !@get "attributes"
    @set "configurations", [] if !@get "configurations"

  #function to provide model as data to send in form as params
  toParam: ->
    modelAttributesTransform = (modelArray)->
      for x in modelArray
        out = {}
        for own key of x
          value = x.get key
          out[key] = value if ("function" != typeof value)
        out
    #special cases
    result = []
    result.addObject
      name: "configurations"
      value: [] #do not include configuration in form params
    result.addObject
      name: "attributes"
      value: modelAttributesTransform @get("attributes")
    #general
    for own name of @
      if !(result.find (x) -> x.name == name)
        result.addObject {name: name, value: @get name}
    result
