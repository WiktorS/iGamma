App.EgbilSearchController = Em.Controller.extend
  search: (view) ->
    searchArgs = getSearchArgs(view)
    jsonMethod = view.get "controller.jsonMethod"
    $.ajax
      url: "#{jsonMethod}.json"
      data: searchArgs
      success: (data) =>
        context = Em.Object.create
          columns: view.get "controller.columns"
          content: data.map(App.Common.toModel, App.EgbilListModel)
          title: view.get "controller.title"
        @get("target").send "goToList", context
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling

getSearchArgs = (view) ->
  result = {}
  for field in view.formFields
    name = field.get "name"
    if !Em.empty name
      result[name] = field.get "value"
  result