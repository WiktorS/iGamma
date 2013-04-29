App.ExtractsController = Em.Controller.extend
  needs: ["gamma", "egbilSearch"]
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

  selectObjects: ->
    type = @get "content.extractType"
    if "prg" == type || "urg" == type
      enabledTabs = ["jrg", "lot"]
    else if "rb" == type
      enabledTabs = ["jrg", "jrb", "building"]
    else if "kb" == type
      enabledTabs = ["jrg", "building"]
    else if "rl" == type
      enabledTabs = ["jrl", "local"]
    else if "kl" == type
      enabledTabs = ["jrg", "jrb", "local"]
    App.EgbilSearchModalView.modal
      controller: @
      activeTab: enabledTabs[0]
      enabledTabs: enabledTabs

  doSearch: (type, content)->
    @get("controllers.egbilSearch").findObjects
      type: type
      content: content
      success: (list) =>
        if type == @get("objectType")
          output = list
        else
          output = Em.A()
          if "jrg" == @get("objectType")
            if "lot" == type
              @get("controllers.gamma").fetchDataCallback list, type, ->
                for lot in list
                  jrgID = lot.get("jrgID")
                  jrgName = lot.get("jrgName")
                  jrgType = lot.get("jrgType")
                  if jrgID && jrgType && !output.find((x)-> x.get("_objectId") == jrgID && x.get("_objectType") == jrgType)
                    output.addObject App.EgbilObjectRegisterUnitModel.create().setProperties
                      _objectId: jrgID
                      _objectName: jrgName
                      _objectType: jrgType
                Em.run.sync()
          else if "jrb" == @get("objectType")
            if "building" == type
              @get("controllers.gamma").fetchDataCallback list, type, ->
                for building in list
                  jrbID = building.get("jrbID")
                  jrbName = building.get("jrbName")
                  if jrbID && !output.find((x)-> x.get("_objectId") == jrbID)
                    output.addObject App.EgbilObjectRegisterUnitModel.create().setProperties
                      _objectId: jrbID
                      _objectName: jrbName
                Em.run.sync()
            else if "jrg" == type
              @get("controllers.gamma").fetchDataCallback list, type, ->
                for jrg in list
                  jrbID = jrg.get("jrbID")
                  jrbName = jrg.get("jrbName")
                  if jrbID && !output.find((x)-> x.get("_objectId") == jrbID)
                    output.addObject App.EgbilObjectRegisterUnitModel.create().setProperties
                      _objectId: jrbID
                      _objectName: jrbName
                Em.run.sync()
          else if "jrl" == @get("objectType")
            if "local" == type
              @get("controllers.gamma").fetchDataCallback list, type, ->
                for local in list
                  jrlID = local.get("jrlID")
                  jrlName = local.get("jrlName")
                  if jrlID && !output.find((x)-> x.get("_objectId") == jrlID)
                    output.addObject App.EgbilObjectRegisterUnitModel.create().setProperties
                      _objectId: jrlID
                      _objectName: jrlName
                Em.run.sync()
            else if "jrg" == type || "jrb" == type
              @get("controllers.gamma").fetchDataCallback list, type, ->
                for jrg in list
                  jrlID = jrg.get("jrlID")
                  jrlName = jrg.get("jrlName")
                  if jrlID && !output.find((x)-> x.get("_objectId") == jrlID)
                    output.addObject App.EgbilObjectRegisterUnitModel.create().setProperties
                      _objectId: jrlID
                      _objectName: jrlName
                Em.run.sync()
        @set "content.registerUnits", output
