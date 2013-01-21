App.EgbilSearchController = Em.Controller.extend
  type: (->
    @get "target.currentState.name"
    ).property("target.currentState.name")

  searchMethod: (->
    type = @get "type"
    @get "searchMethodData.#{type}"
    ).property("type")
  searchMethodData:
    building: "getBuildings"
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
    jsonMethod = @get "searchMethod"
    $.ajax
      url: "#{jsonMethod}.json"
      data: searchArgs
      success: (data) =>
        @set "target.egbilListController.type", @get("type")
        @set "target.egbilListController.content", Em.A(data.map(App.Common.toModel, App.EgbilListModel))
        @get("target").send "goToList"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
