App.Router.map ->
  @resource "egbil", ->
    @route "egbilMap", {path: "mapa"}
    @resource "egbilSearch", {path: "szukaj"}, ->
      @route "jrg", {path: "jednostki rejestrowe gruntów i budynków"}
      @route "jrb", {path: "jednostki rejestrowe budynków"}
      @route "jrl", {path: "jednostki rejestrowe lokali"}
      @route "oldJrg", {path: "stare jednostki rejestrowe gruntów"}
      @route "lot", {path: "działki"}
      @route "building", {path: "budynki"}
      @route "local", {path: "lokale"}
      @route "person", {path: "osoby fizyczne"}
      @route "institution", {path: "instytucje"}
      @route "group", {path: "podmioty grupowe"}
      @route "landCommunity", {path: "zarządy wspolnot gruntowych"}
      @route "document", {path: "dokumenty"}
    @route "egbilList", {path: "wyniki"}
    @resource "egbilObject", {path: "obiekt"}, ->
      @route "jrg", {path: "jednostka rejestrowa gruntów i budynków/:name/:id"}
      @route "jrb", {path: "jednostka rejestrowa budynków/:name/:id"}
      @route "jrl", {path: "jednostka rejestrowa lokali/:name/:id"}
      @route "oldJrg", {path: "stara jednostka rejestrowa gruntów/:name/:id"}
      @route "document", {path: "dokument/:name/:id"}
      @route "lot", {path: "działka/:name/:id"}
      @route "building", {path: "budynek/:name/:id"}
      @route "local", {path: "lokal/:name/:id"}
      @route "person", {path: "osoba fizyczne/:name/:id"}
      @route "institution", {path: "instytucja/:name/:id"}
      @route "group", {path: "podmiot grupowy/:name/:id"}
      @route "landCommunity", {path: "zarząd wspólnoty gruntowej/:name/:id"}
  @resource "changes", {path: "zmiany"}, ->
    @route "changesMap", {path: "mapa"}
    @route "changesSearch", {path: "szukaj"}
    @route "changesList", {path: "wyniki"}
    @resource "changesObject", {path: "obiekt"}, ->
      @route "change", {path: "zmiana/:name/:id"}
  @resource "prints", {path: "wydruki"}, ->
    @resource "extracts", {path: "wypisy"}, ->
      @route "prg", {path: "wypis pełny z rejestru gruntów"}
      @route "urg", {path: "wypis uproszczony z rejestru gruntów"}
      @route "rb", {path: "wypis z rejestru budynków"}
      @route "kb", {path: "wypis z kartoteki budynków"}
      @route "rl", {path: "wypis z rejestru lokali"}
      @route "kl", {path: "wypis z kartoteki lokali"}
    @route "lotIndex", {path: "skorowidz działek"}
    @resource "entityIndexes", {path: "skorowidze danych podmiotowych"}, ->
      @route "entitiesIndex", {path: "wykaz podmiotów"}
      @route "possesionsIndex", {path: "wykaz władających"}
      @route "leasesIndex", {path: "wykaz dzierżawców"}
      @route "incorrectShares", {path: "błędne udziały"}
    @resource "rankings", {path: "wykazy i zestawienia"}, ->
      @route "landsIndex", {path: "wykaz gruntów"}
      @route "buildingsIndex", {path: "wykaz budynków"}
      @route "localsIndex", {path: "wykaz lokali"}
      @route "landsRanking", {path: "zestawienie gruntów"}
      @route "terrainRanking", {path: "zestawienie użytków"}
    @resource "changeNotification", {path: "zawiadomienie o zmianie"}, ->
      @route "standardNotification" , {path: "zawiadomienie standardowe"}
      @route "taxNotification" , {path: "zawiadomienie podatkowe"}
      @route "taxClassification" , {path: "klasyfikacja podatkowa użytków"}
    @route "changesApplicationReport", {path: "dziennik zgłoszeń zmian"}
    @route "customReport", {path: "raporty dowolne"}

#TODO: Rewrite to conform new router in the right way

App.Route = RouteWithParentMemory = Em.Route.extend
  defaultRoute: null
  defaultRouteModel: null
  #its rather unlikely that these computed properties will ever change
  parent: (->
    for handlerInfo in @router.router.currentHandlerInfos
      current = handlerInfo.handler
      if current == @
        return parent
      parent = current
    null
    ).property()
  isDynamic: (->
    for handlerInfo in @router.router.currentHandlerInfos
      if handlerInfo.handler == @
        return handlerInfo.isDynamic
    false
    ).property()
  isLeafRoute: (-> !!@get("routeName").match(/^(index|.+\..+)$/)).property() # match index or <sth>.<sth> (don't change / to ")
  isIndexRoute: (-> !!@get("routeName").match(/(^|.+\.)index$/)).property() # match index or <sth>.index (don't change / to ")

  activate: ->
    routeName = @get("routeName")
    if !@get "isIndexRoute"
      parent = @get "parent"
      if parent?
        parent.set "defaultRoute", routeName
        if @get("isDynamic") #save model only is this is dynamic route
          parent.set "defaultRouteModel", @get "context" # or maybe better @modelFor(routeName)
  redirect: ->
    if @get "isLeafRoute"
      parent = @get "parent"
      defaultRoute = parent.get "defaultRoute"
      defaultRouteModel = parent.get "defaultRouteModel"
      if !Em.isEmpty(defaultRoute) && defaultRoute != @get("routeName")
        if Em.isEmpty defaultRouteModel
          @transitionTo defaultRoute
        else
          @transitionTo defaultRoute, defaultRouteModel

App.IndexRoute = RouteWithParentMemory.extend()

App.ApplicationRoute = Ember.Route.extend
  defaultRoute: "egbil"
  events:
    openObject: (context) ->
      @controllerFor("gamma").openObject context.get("_objectId"), context.get("_objectType")
    # closeObject: (context) ->
    #   @controllerFor("gamma").closeObject context.get("_objectId"), context.get("_objectType")
    showObject: (context) ->
      @controllerFor("gamma").showObject context.get("_objectId"), context.get("_objectType")
    goToObject: (context) ->
      objectRoute = context.get("_objectRoute")
      @transitionTo objectRoute, context
    printForm: (params, printForm, action) ->
      printForm.attr "action", action
      #append hidden fields with values to submit
      hiddenInputs = []
      for param in params
        if param.value && printForm.find("input[name='#{param.name}']").length == 0
          if Em.isArray(param.value)
            #WARNING: not all combinations are covered here, enough for now
            for item,i in param.value
              if typeof item == "object"
                for own key,value of item
                  hiddenInputs.addObject $("<input/>", {type: "hidden", name: "#{param.name}[#{i}][#{key}]"}).val(value).appendTo(printForm)[0]
              else
                hiddenInputs.addObject $("<input/>", {type: "hidden", name: "#{param.name}[#{i}]"}).val(item).appendTo(printForm)[0]
          else
            hiddenInputs.addObject $("<input/>", {type: "hidden", name: param.name}).val(param.value).appendTo(printForm)[0]
      # #generate unique popup window
      # target = "print-popup-" + (new Date()).valueOf()
      # printForm.attr "target", target
      # printForm.one "submit", -> window.open "", target
      printForm.submit()
      #cleanup the mess
      $(hiddenInputs).remove()
    openTerrainCategoryReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param({object: context}))
      url = "/getTerrainCategorySummary?#{args}"
      window.open(url)
    openReservation: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getReservation?#{args}"
      window.open(url)
    openCustomReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getCustomReport?#{args}"
      window.open(url)
    openDifferenceReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getDifferenceReport?#{args}"
      window.open(url)
    showScan: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getScan?#{args}"
      window.open(url)

App.EgbilRoute = RouteWithParentMemory.extend
  defaultRoute: "egbilSearch"
  renderTemplate: ->
    @render "egbil",
      controller: @controllerFor "gamma"
App.EgbilIndexRoute = RouteWithParentMemory.extend()

App.EgbilEgbilMapRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaMap"

App.EgbilSearchRoute = RouteWithParentMemory.extend
  defaultRoute: "egbilSearch.jrg"
  renderTemplate: ->
    @render "egbilSearch"
  events:
    goToList: (context) ->
      @controllerFor("egbilList").set "type", context.get("type")
      @controllerFor("egbilList").set "content", context.get("list")
      @transitionTo "egbil.egbilList"

App.EgbilSearchIndexRoute = RouteWithParentMemory.extend()

SearchObjectRoute = RouteWithParentMemory.extend
  events:
    doSearch: (context) ->
      @controllerFor(@get "lastRenderedTemplate")?.doSearch()

App.EgbilSearchJrgRoute = SearchObjectRoute.extend()
App.EgbilSearchJrbRoute = SearchObjectRoute.extend()
App.EgbilSearchJrlRoute = SearchObjectRoute.extend()
App.EgbilSearchOldJrgRoute = SearchObjectRoute.extend()
App.EgbilSearchLotRoute = SearchObjectRoute.extend()
App.EgbilSearchBuildingRoute = SearchObjectRoute.extend()
App.EgbilSearchLocalRoute = SearchObjectRoute.extend()
App.EgbilSearchPersonRoute = SearchObjectRoute.extend()
App.EgbilSearchInstitutionRoute = SearchObjectRoute.extend()
App.EgbilSearchGroupRoute = SearchObjectRoute.extend()
App.EgbilSearchLandCommunityRoute = SearchObjectRoute.extend()
App.EgbilSearchDocumentRoute = SearchObjectRoute.extend()

App.EgbilEgbilListRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaList",
      controller: @controllerFor "egbilList"
  events:
    doRightPanelAction: (context) ->
      checkedList = @controllerFor("egbilList").get("checkedList")
      @controllerFor("gamma").rightPanelAction(context.get("type"), checkedList)

App.ChangesRoute = RouteWithParentMemory.extend
  defaultRoute: "changes.changesSearch"
  renderTemplate: ->
    @render "changes",
      controller: @controllerFor "gamma"
App.ChangesIndexRoute = RouteWithParentMemory.extend()

App.ChangesChangesMapRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaMap"

App.ChangesChangesSearchRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "changesSearch"
  events:
    goToList: (context) ->
      @controllerFor("changesList").set "type", context.get("type")
      @controllerFor("changesList").set "content", context.get("list")
      @transitionTo "changes.changesList"

App.ChangesChangesListRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaList",
      controller: @controllerFor "changesList"
  events:
    doRightPanelAction: (context) ->
      checkedList = @controllerFor("changesList").get("checkedList")
      @controllerFor("gamma").rightPanelAction(context.get("type"), checkedList)

App.ChangesObjectRoute = App.EgbilObjectRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaObject"
App.ChangesObjectIndexRoute = App.EgbilObjectIndexRoute = RouteWithParentMemory.extend()


#TODO: Rewrite - data is not fetch in right way and sometimes we can get double transitions!
RouteWithObjectParam = RouteWithParentMemory.extend
  objectId: null
  objectType: (-> @get("routeName").split(".")[1]).property("routeName") #TODO: Maybe this can be done better
  objectName: null
  objectOutletName: null
  # setupController: (controller, model) ->
  #   debugger
  model: (params)->
    #have to use setProporties because some of set proporties are computed proporties
    object = App.GammaObjectModel.create().setProperties
      _objectId: parseInt(params.id)
      _objectType: @get "objectType"
      _objectName: params.name
    Em.run.sync()
    object
  serialize: (model, params) ->
    result =
      id: model.get "_objectId"
      name: model.get "_objectName"
  renderTemplate: (controller, model)->
    Em.assert "Object type doesn't match state type", @get("objectType") == model.get("_objectType")
    @set "objectId", model.get "_objectId"
    @set "objectName", model.get "_objectName"
    object = @controllerFor("gamma").getObject @get("objectId"), @get("objectType")
    if !Em.isEmpty object
      @controllerFor("gammaObject").set "content", object
      @controllerFor(@get("objectOutletName")).set "content", object
      # @controllerFor(@get("routeName")).set "content", object
      @render @get("objectOutletName")
    else
      @controllerFor("gamma").openObject model.get("_objectId"), model.get("_objectType")

App.EgbilObjectJrgRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrg"
App.EgbilObjectJrbRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrb"
App.EgbilObjectJrlRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrl"
App.EgbilObjectOldJrgRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectOldJrg"
App.EgbilObjectDocumentRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectDocument"
App.EgbilObjectLotRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLot"
App.EgbilObjectBuildingRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectBuilding"
App.EgbilObjectLocalRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLocal"
App.EgbilObjectPersonRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectPerson"
App.EgbilObjectInstitutionRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectInstitution"
App.EgbilObjectGroupRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectGroup"
App.EgbilObjectLandCommunityRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLandCommunity"
App.ChangesObjectChangeRoute = RouteWithObjectParam.extend
  objectOutletName: "changesObjectChange"



App.PrintsRoute = RouteWithParentMemory.extend
  defaultRoute: "extracts"
App.PrintsIndexRoute = RouteWithParentMemory.extend()

App.ExtractsRoute = RouteWithParentMemory.extend
  defaultRoute: "extracts.prg"
  model: -> App.PrintExtractsModel.create()
  setupController: (controller, context) ->
    @controllerFor("prints").set "content", context
App.ExtractsIndexRoute = RouteWithParentMemory.extend()
App.ExtractsPrgRoute = RouteWithParentMemory.extend()
App.ExtractsUrgRoute = RouteWithParentMemory.extend()
App.ExtractsRbRoute = RouteWithParentMemory.extend()
App.ExtractsKbRoute = RouteWithParentMemory.extend()
App.ExtractsRlRoute = RouteWithParentMemory.extend()
App.ExtractsKlRoute = RouteWithParentMemory.extend()

App.PrintsLotIndexRoute = RouteWithParentMemory.extend
  model: -> App.PrintLotIndexModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context

App.EntityIndexesRoute = RouteWithParentMemory.extend
  model: -> App.PrintEntityIndexesModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context
App.EntityIndexesIndexRoute = RouteWithParentMemory.extend()
App.EntityIndexesEntitiesIndexRoute = RouteWithParentMemory.extend()
App.EntityIndexesPossesionsIndexRoute = RouteWithParentMemory.extend()
App.EntityIndexesLeasesIndexRoute = RouteWithParentMemory.extend()
App.EntityIndexesIncorrectSharesRoute = RouteWithParentMemory.extend()

App.RankingsRoute = RouteWithParentMemory.extend
  model: -> App.PrintRankingsModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context
App.RankingsIndexRoute = RouteWithParentMemory.extend()
App.RankingsLandsIndexRoute = RouteWithParentMemory.extend
  model: -> @modelFor "rankings"
App.RankingsBuildingsIndexRoute = RouteWithParentMemory.extend
  model: -> @modelFor "rankings"
App.RankingsLocalsIndexRoute = RouteWithParentMemory.extend
  model: -> @modelFor "rankings"
App.RankingsLandsRankingRoute = RouteWithParentMemory.extend
  model: -> @modelFor "rankings"
App.RankingsTerrainRankingRoute = RouteWithParentMemory.extend
  model: -> @modelFor "rankings"

App.ChangeNotificationRoute = RouteWithParentMemory.extend
  model: -> App.PrintChangeNotificationModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context
App.ChangeNotificationIndexRoute = RouteWithParentMemory.extend()
App.ChangeNotificationStandardNotificationRoute = RouteWithParentMemory.extend()
App.ChangeNotificationTaxNotificationRoute = RouteWithParentMemory.extend()
App.ChangeNotificationTaxClassificationRoute = RouteWithParentMemory.extend()

App.PrintsChangesApplicationReportRoute = RouteWithParentMemory.extend
  model: -> App.PrintChangesApplicationReportModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context

App.PrintsCustomReportRoute = RouteWithParentMemory.extend
  model: -> App.PrintCustomReportModel.create()
  setupController: (controller, context) -> @controllerFor("prints").set "content", context
