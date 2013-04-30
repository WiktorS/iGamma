App.ChangesRoute = App.Route.extend
  defaultRoute: "changesSearch"
  renderTemplate: ->
    @render "changes",
      controller: @controllerFor "gamma"

App.ChangesChangesMapRoute = App.Route.extend
  renderTemplate: -> @render "gammaMap"

App.ChangesSearchRoute = App.Route.extend
  model: -> App.ChangesSearchModel.create()
  events:
    goToList: (context) ->
      @controllerFor("changesList").set "type", context.get("type")
      @controllerFor("changesList").set "content", context.get("list")
      @transitionTo "changes.changesList"

App.ChangesChangesListRoute = App.Route.extend
  renderTemplate: ->
    @render "gammaList",
      controller: @controllerFor "changesList"
  events:
    doRightPanelAction: (context) ->
      checkedList = @controllerFor("changesList").get("checkedList")
      @controllerFor("gamma").rightPanelAction(context.get("type"), checkedList)

App.ChangesObjectRoute = App.EgbilObjectRoute = App.Route.extend
  renderTemplate: -> @render "gammaObject"
