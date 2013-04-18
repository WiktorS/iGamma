App.PrintChangeNotificationModel = Em.Object.extend
  number: null
  printChanges: null
  shareInfo: null
  shareType: null
  onlyShares: null
  noPESEL: null
  noNIP: null
  infoHeader: null
  dataType: null
  shareSummary: null
  buildingIndex: null
  buildingIndexType: null
  localIndex: null
  localIndexType: null
  chosenRegisterUnits: null
  frontPage: null
  onlyChosen: null
  entities: null
  lots: null
  buildings: null
  locals: null
  landPossesing: null
  personType: null
  recipients: null
  receivers: null
  changeRegisterUnits: null


  init:->
    @_super()
    #init/default values
    @set "chosenRegisterUnits", Em.A()
    @set "recipients", Em.A()
    @set "receivers", Em.A()
    @set "changeRegisterUnits", Em.A()
    @set "shareType", "changes"
    @set "dataType", "changes"
    @set "buildingIndexType", "changes"
    @set "localIndexType","changes"
    @set "personType", "old"

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
    # result.addObject
    #   name: "clauses"
    #   value: modelArrayTransform(@get("clauses"), {id: "id", text: "clauseText"})
    # result.addObject
    #   name: "lots"
    #   value: modelArrayTransform @get("lots")
    # result.addObject
    #   name: "buildings"
    #   value: modelArrayTransform @get("buildings")
    # result.addObject
    #   name: "locals"
    #   value: modelArrayTransform @get("locals")
    # result.addObject
    #   name: "shares"
    #   value: modelArrayTransform @get("shares")
    #general
    for own name of @
      if !(result.find (x) -> x.name == name)
        result.addObject {name: name, value: @get name}
    result