App.Router.map ->
  @resource "egbil", ->
    @route "map"
      path: "mapa"
    @resource "search", {path: "/szukaj"}, ->
      @route "jrg",
        path: "/jednostki rejestrowe gruntów i budynków"
      @route "jrb",
        path: "/jednostki rejestrowe budynków"
      @route "jrl",
        path: "/jednostki rejestrowe lokali"
      @route "oldJrg",
        path: "/stare jednostki rejestrowe gruntów"
      @route "lot",
        path: "/działki"
      @route "building",
        path: "/budynki"
      @route "local",
        path: "/lokale"
      @route "person",
        path: "/osoby fizyczne"
      @route "institution",
        path: "/instytucje"
      @route "group",
        path: "/podmioty grupowe"
      @route "landCommunity",
        path: "/zarządy wspolnot gruntowych"
      @route "document",
        path: "/dokumenty"
    @route "list"
      path: "/wyniki"
    @resource "egbilObject", {path: "/obiekt"}, ->
      @route "jrg",
        path: "/jednostka rejestrowa gruntów i budynków/:name/:id"
      @route "jrb",
        path: "/jednostka rejestrowa budynków/:name/:id"
      @route "jrl",
        path: "/jednostka rejestrowa lokali/:name/:id"
      @route "oldJrg",
        path: "/stara jednostka rejestrowa gruntów/:name/:id"
      @route "document",
        path: "/dokument/:name/:id"
      @route "lot",
        path: "/działka/:name/:id"
      @route "building",
        path: "/budynek/:name/:id"
      @route "local",
        path: "/lokal/:name/:id"
      @route "person",
        path: "/osoba fizyczne/:name/:id"
      @route "institution",
        path: "/instytucja/:name/:id"
      @route "group",
        path: "/podmiot grupowy/:name/:id"
      @route "landCommunity",
        path: "/zarząd wspólnoty gruntowej/:name/:id"
  @resource "changes", {path: "/zmiany"}, ->
    @route "map"
      path: "/mapa"
    @route "search"
      path: "/szukaj"
    @route "list"
      path: "/wyniki"
    @resource "changesObject", {path: "/obiekt"}, ->
      @route "change",
        path: "/zmiana/:name/:id"
  @route "prints"
    path: "wydruki"


#TODO: Rewrite to conform new router in the right way

RouteWithParentMemory = Em.Route.extend
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
  isLeafRoute: (-> !!@get("routeName").match(/^(index|.+\..+)$/)).property() # match index or <sth>.<sth> (don't change / to ")
  isIndexRoute: (-> !!@get("routeName").match(/(^|.+\.)index$/)).property() # match index or <sth>.index (don't change / to ")

  activate: ->
    routeName = @get("routeName")
    if !@get "isIndexRoute"
      parent = @get "parent"
      if parent?
        parent.set "defaultRoute", routeName
        parent.set "defaultRouteModel", @get "context" # or maybe better @modelFor(routeName)
  # setup: (context) ->
  #   @_super context
  #   if @get "isLeafRoute"
  #     parent = @get "parent"
  #     defaultRoute = parent.get "defaultRoute"
  #     defaultRouteModel = parent.get "defaultRouteModel"
  #     if !Em.isEmpty defaultRoute
  #       if Em.isEmpty defaultRouteModel
  #         @transitionTo defaultRoute
  #       else
  #         @transitionTo defaultRoute, defaultRouteModel
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
  defaultRoute: "search"
  renderTemplate: ->
    @render "egbil",
      controller: @controllerFor "gamma"
App.EgbilIndexRoute = RouteWithParentMemory.extend()

App.EgbilMapRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaMap"

App.SearchRoute = RouteWithParentMemory.extend
  defaultRoute: "search.jrg"
  renderTemplate: ->
    @render "egbilSearch"
  events:
    goToList: (context) ->
      @controllerFor("egbilList").set "type", context.get("type")
      @controllerFor("egbilList").set "content", context.get("list")
      @transitionTo "egbil.list"

App.SearchIndexRoute = RouteWithParentMemory.extend()

App.SearchJrgRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchJrg"

App.SearchJrbRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchJrb"

App.SearchJrlRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchJrl"

App.SearchOldJrgRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchOldJrg"

App.SearchLotRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchLot"

App.SearchBuildingRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchBuilding"

App.SearchLocalRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchLocal"

App.SearchPersonRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchPerson"

App.SearchInstitutionRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchInstitution"

App.SearchGroupRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchGroup"

App.SearchLandCommunityRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchLandCommunity"

App.SearchDocumentRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "egbilSearchDocument"

App.EgbilListRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaList",
      controller: @controllerFor "egbilList"

App.ChangesRoute = RouteWithParentMemory.extend
  defaultRoute: "changes.search"
  renderTemplate: ->
    @render "changes",
      controller: @controllerFor "gamma"
App.ChangesIndexRoute = RouteWithParentMemory.extend()

App.ChangesMapRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaMap"

App.ChangesSearchRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "changesSearch"
  events:
    goToList: (context) ->
      @controllerFor("changesList").set "type", context.get("type")
      @controllerFor("changesList").set "content", context.get("list")
      @transitionTo "changes.list"

App.ChangesListRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaList",
      controller: @controllerFor "changesList"

App.ChangesObjectRoute = App.EgbilObjectRoute = RouteWithParentMemory.extend
  renderTemplate: ->
    @render "gammaObject"
App.ChangesObjectIndexRoute = App.EgbilObjectIndexRoute = RouteWithParentMemory.extend()


#TODO: Rewrite!
RouteWithObjectParam = RouteWithParentMemory.extend
  objectId: null
  objectType: (-> @get("routeName").split(".")[1]).property("routeName") #TODO: Maybe this can be done better
  objectName: null
  objectOutletName: null
  # setupController: (controller) ->
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
