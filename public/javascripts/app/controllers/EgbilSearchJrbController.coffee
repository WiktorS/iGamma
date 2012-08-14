App.EgbilSearchJrbController = Em.Controller.extend
  content: App.EgbilSearchJrbModel.create()
  fetch: (event) ->
    $.ajax
      url: "/getRegisterUnitsByJrb.json"
      dataType: "json"
      data: {"jrb": @content.jrbNumber.value}
      success: (data) ->
        App.router.egbilListController.set "content", data
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown
