App.EgbilSearchJrbController = Em.Controller.extend
  content: App.EgbilSearchModel.create()
  columns: [
    "check"
    "show"
    "marker"
    "jrbNumber"
    "precinct"
    "cadastralUnit"
    "creationProof"
    "creationDate"
  ]

  fetch: (event) ->
    $.ajax
      url: "/getRegisterUnitsByJrb.json"
      dataType: "json"
      data: {"jrb": @content.registerUnit.jrb.value}
      success: (data) =>
        App.router.egbilListController.set "columns", @columns
        App.router.egbilListController.set "content", data.map(App.Common.toModel, App.EgbilListModel)
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown
