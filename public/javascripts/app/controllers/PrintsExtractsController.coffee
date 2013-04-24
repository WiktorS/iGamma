App.ExtractsController = Em.Controller.extend
  needs: ["gamma"]
  #input params
  content: null

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView
  #values determined with current route
  _routeChanged: (->
    if @get("inExtractsRoute")
      router = @get("router")
      @set "content.extractType",
        if router.isActive "extracts.prg" then "prg"
        else if router.isActive "extracts.urg" then "urg"
        else if router.isActive "extracts.rb" then "rb"
        else if router.isActive "extracts.kb" then "kb"
        else if router.isActive "extracts.rl" then "rl"
        else if router.isActive "extracts.kl" then "kl"
    ).observes("router.url")
  objectType: (->
    type = @get("content.extractType") ? ""
    if type.match ".*g$" then "jrg"
    else if type.match ".*b$" then "jrb"
    else if type.match ".*l$" then "jrl"
    else "jrg" #default to jrg to reduce checks in code
    ).property("content.extractType")

  inExtractsRoute: (-> @get("router").isActive "extracts").property("router.url")
  canSelectObjectsBinding: "inExtractsRoute"

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
  selectedObjectsBinding: "content.registerUnits"

  isSimpleExtract: (-> "urg" == @get "content.extractType").property("content.extractType")
  isJrg: (-> "jrg" == @get "objectType").property("objectType")
  isJrb: (-> "jrb" == @get "objectType").property("objectType")
  isJrl: (-> "jrl" == @get "objectType").property("objectType")

  _extractTypeChanged: (->
    @getClauses(@get "objectType")
    ).observes("content.extractType")

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

  fetchDataCallback: (fetchQueue, type) ->
    @get("controllers.gamma").fetchDataCallback(fetchQueue, type)
