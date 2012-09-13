App.EgbilSearchJrlController = Em.Controller.extend
  content: App.EgbilSearchModel.create()
  columns: [
    "check"
    "show"
    "marker"
    "jrlNumber"
    "precinct"
    "cadastralUnit"
    "creationProof"
    "creationDate"
  ]

  fetch: (event) ->
    $.ajax
      url: "/getRegisterUnitsByJrl.json"
      dataType: "json"
      data: {"jrl": @content.registerUnit.jrl.value}
      success: (data) =>
        App.router.egbilListController.set "columns", @columns
        App.router.egbilListController.set "content", data.map(App.Common.toModel, App.EgbilListModel)
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown