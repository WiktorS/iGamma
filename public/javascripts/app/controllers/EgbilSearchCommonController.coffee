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
        App.router.set "egbilListController.columns", @columns
        App.router.set "egbilListController.content", data.map(App.Common.toModel, App.EgbilListModel)
        App.router.transitionTo "list"
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown

  getSearchArgs: (view) ->
    result = {} 
    for field in view.formFields
      name = field.get "name"
      if !Em.empty name
        result[name] = field.get "value"
    result
