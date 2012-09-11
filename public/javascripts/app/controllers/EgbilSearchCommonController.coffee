App.EgbilSearchCommonController = Em.Controller.extend
  content: App.EgbilSearchModel.create()
  columns: null
  jsonMethod: null

  search: (e) ->
    searchArgs = @getSearchArgs(e.view)
    $.ajax
      url: "#{@jsonMethod}.json"
      data: searchArgs
      success: (data) =>
        context = Em.Object.create
          columns: @get "columns"
          content: data.map(App.Common.toModel, App.EgbilListModel)
        App.router.send "goToList", context
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling

  getSearchArgs: (view) ->
    result = {} 
    for field in view.formFields
      name = field.get "name"
      if !Em.empty name
        result[name] = field.get "value"
    result
