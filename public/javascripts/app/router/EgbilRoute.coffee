App.EgbilRoute = App.Route.extend
  defaultRoute: "egbilSearch"
  renderTemplate: -> @render "egbil", {controller: @controllerFor "gamma"}

App.EgbilEgbilMapRoute = App.Route.extend
  renderTemplate: -> @render "gammaMap"

App.EgbilSearchRoute = App.Route.extend
  defaultRoute: "egbilSearch.jrg"
  #computed properties based on current route
  currentRoute: (->

    ).property("router.url")
  events:
    goToList: (context) ->
      @controllerFor("egbilList").set "type", context.get("type")
      @controllerFor("egbilList").set "content", context.get("list")
      @transitionTo "egbil.egbilList"
    doSearch: (context) ->
      currentRoute = @get("router.router.currentHandlerInfos.lastObject.handler")
      currentRoute.get("controller")?.doSearch()
      # @get("router.router.currentHandlerInfos.lastObject.handler.controller")?.doSearch()

EgbilSearchObjectRoute = App.Route.extend
  model: -> App.EgbilSearchModel.create()
App.EgbilSearchJrgRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchJrbRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchJrlRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchOldJrgRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchLotRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchBuildingRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchLocalRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchPersonRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchInstitutionRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchGroupRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchLandCommunityRoute = EgbilSearchObjectRoute.extend()
App.EgbilSearchDocumentRoute = EgbilSearchObjectRoute.extend()

App.EgbilEgbilListRoute = App.Route.extend
  renderTemplate: -> @render "gammaList", {controller: @controllerFor "egbilList"}
  events:
    doRightPanelAction: (context) ->
      checkedList = @controllerFor("egbilList").get("checkedList")
      @controllerFor("gamma").rightPanelAction(context.get("type"), checkedList)
