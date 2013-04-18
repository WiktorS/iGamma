App.ExtractsController = Em.Controller.extend
  #input params
  content: null

  #values determined with current route
  objectType: (->
    type = @get("extractType") ? ""
    if type.match ".*g$" then "jrg"
    else if type.match ".*b$" then "jrb"
    else if type.match ".*l$" then "jrl"
    else "jrg" #default to jrg to reduce checks in code
    ).property("extractType")
  extractType: (->
    router = @get("target")
    if router.isActive "extracts.prg" then "prg"
    else if router.isActive "extracts.urg" then "urg"
    else if router.isActive "extracts.rb" then "rb"
    else if router.isActive "extracts.kb" then "kb"
    else if router.isActive "extracts.rl" then "rl"
    else if router.isActive "extracts.kl" then "kl"
    ).property("target.url")

  canSelectObjects: true

  #columns
  columnsOrder:
    jrg: [ "jrg", "precinct", "cadastralUnit" ]
    jrb: [ "jrb", "precinct", "cadastralUnit" ]
    jrl: [ "jrl", "precinct", "cadastralUnit" ]
  extractsColumns: (->
      type = @get "objectType"
      columns = @get "columnsOrder.#{type}"
      Em.assert "No columns defined for type: #{type}", !!columns
      App.Columns.getColumns(columns)
    ).property("objectType")

  isSimpleExtract: (-> "urg" == @get "extractType").property("extractType")
  isJrg: (-> "jrg" == @get "objectType").property("objectType")
  isJrb: (-> "jrb" == @get "objectType").property("objectType")
  isJrl: (-> "jrl" == @get "objectType").property("objectType")

  _extractTypeChanged: (->
    @getClauses(@get "objectType")
    ).observes("extractType")

  getClauses: (type)->
    clauses = @get "content.clauses"
    $.ajax
      url: "getPrintClauses.json"
      data:
        printType: type
      success: (data) ->
        if Em.isArray data
          clauses.clear()
          clauses.addObject App.Common.toModel.call(App.PrintClauseModel, item) for item in data
          #save default clause text for later use
          item.set "clauseDefaultText", item.get("clauseText") for item in clauses
        return
