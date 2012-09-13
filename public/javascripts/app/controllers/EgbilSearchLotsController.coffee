App.EgbilSearchLotsController = Em.ObjectController.extend
  content: App.EgbilSearchModel.create()
  columns: [
    "check"
    "show"
    "marker"
    "number"
    "cadastralSheet"
    "precinct"
    "cadastralUnit"
    "numberJRG"
    "address"
    "document"
    "cadastralArea"
  ]

  fetch: (event) ->
    $.ajax
      url: "/getLotsByNumber.json"
      dataType: "json"
      data: {"number": @content.lot.number.value}
      success: (data) =>
        App.router.egbilListController.set "columns", @columns
        App.router.egbilListController.set "content", data.map(App.Common.toModel, App.EgbilListModel)
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown