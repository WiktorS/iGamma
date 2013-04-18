App.ExtractsTabSelectedController = Em.Controller.extend
  needs: ["extracts", "gamma"]

  content: null
  extractType: null
  objectTypeBinding: "controllers.extracts.objectType"

  getColumns: (type)->
    objectType = @get "objectType"
    columnsOrder = @get("columnsOrder.#{type}.#{objectType}") ? @get("columnsOrder.#{type}")
    Em.assert "Column order in #{@get("constructor").toString()} is not defined for type '#{type}'", columnsOrder
    App.Columns.getColumns columnsOrder
  columnsOrder:
    building: [ "check", "building", "buildingKind", "buildingArea" ]
    local: [ "check","local","address", "usableArea" ]
    lot: [ "check","precinct", "lot", "cadastralArea" ]
    share:
      jrl: [ "check", "entity", "shareValue", "characterL" ]
      jrb: [ "check", "entity", "shareValue", "characterB" ]
      jrg: [ "check", "entity", "shareValue", "characterG" ]

  fetchDataCallback: (fetchQueue, type) ->
    @get("controllers.gamma").fetchDataCallback(fetchQueue, type)
