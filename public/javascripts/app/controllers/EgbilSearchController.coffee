App.EgbilSearchController = Em.Controller.extend
  type: (->
    @get "target.currentState.name"
    ).property("target.currentState.name")

  queryName: (->
    type = @get "type"
    @get "queryNameData.#{type}"
    ).property("type")
  queryNameData:
    building: "6. 2 Budynek na punktach graficznych"
    document: "getDocuments"
    group: "getGroupByNip"
    individual: "getPersonByPesel"
    institution: "getInstitutionByNip"
    jrb: "getRegisterUnits"
    jrg: "getRegisterUnits"
    jrgib: "getRegisterUnits"
    jrl: "getRegisterUnits"
    landCommunity: "getLandCommunities"
    local: "getLocalByNumber"
    lot: "getLotsByNumber"

  doSearch: (searchArgs) ->
    $.ajax
      type: "POST"
      url: "findObjects.json"
      data:
        queryName: @get "queryName"
        queryArgs: searchArgs
      success: (data) =>
        if Em.isArray data
          @set "target.egbilListController.type", @get("type")
          list = Em.A(data.map(App.Common.toModel, App.EgbilListModel))
          #set all rows to IDLE state with just ID
          for own k,v of data
            list.set "#{k}.id", v
            list.set "#{k}.rowState", App.RowState.IDLE
          @set "target.egbilListController.content", list
          @get("target").send "goToList"
        else
          alert "Brak wyników" #TODO: error handling
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
