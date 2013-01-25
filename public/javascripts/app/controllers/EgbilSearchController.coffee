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
        if data?
          @set "target.egbilListController.type", @get("type")
          @set "target.egbilListController.content", Em.A(data.map(App.Common.toModel, App.EgbilListModel))
          @get("target").send "goToList"
        else
          alert "Brak wyników" #TODO: error handling
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
