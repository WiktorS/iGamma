App.EgbilSearchJrbController = Em.Controller.extend
  content: App.EgbilSearchModel.create()
  fetch: (event) ->
    $.ajax
      url: "/getRegisterUnitsByJrb.json"
      dataType: "json"
      data: {"jrb": @content.jrbNumber.value}
      success: (data) ->
        list = []
        $.each(data, (i, item) ->
          model = App.EgbilListJrModel.create {}
          $.each(item, (key, value) =>
            model.get(key)?.value = value
          )
          list.push model
        )
        App.router.egbilListController.set "content", list
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown
