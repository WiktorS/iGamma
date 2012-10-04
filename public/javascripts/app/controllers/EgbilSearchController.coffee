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
          type: view.get "controller.type"
          title: view.get "controller.title"
        @get("target").send "goToList", context
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling

getSearchArgs = (view) ->
  result = {}
  result["type"] = view.get("controller.type") if view.get("controller.type")?
  for field in view.formFields
    name = field.get "name"
    value = field.get "value"
    if !Em.empty(name) && !Em.empty(value)
      result[name] = value
  result
