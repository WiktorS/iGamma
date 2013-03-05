RouteWithParentMemory = Em.Route.extend
  enter: (router) -> @parentState.set 'initialState', @name


RouteWithObjectParam = Em.Route.extend
  objectId: null
  objectType: (-> @get "name").property("name")
  objectName: null
  objectOutletName: null
  deserialize: (router, params) ->
    object = App.EgbilObjectModel.create().setProperties
      _objectId: parseInt(params.id)
      _objectType: @get "objectType"
      _objectName: params.name
    Em.run.sync() 
    object
  serialize: (router, context) ->
    Em.Object.create
      id: context.get "_objectId"
      name: context.get "_objectName"
  connectOutlets: (router, context) ->
    Em.assert "Object type doesn't match state type", @get("objectType") == context.get("_objectType")
    @set "objectId", context.get "_objectId"
    @set "objectName", context.get "_objectName"
    object = router.get("egbilController").getObject @get("objectId"), @get("objectType")
    if !Em.empty object
      router.get("egbilController").connectOutlet(
        outletName: "egbil"
        name: "egbilObject"
        context: object
      )
      router.get("egbilObjectController").connectOutlet(
        outletName: "egbilObject"
        name: @get("objectOutletName")
        context: object
      )
    else
      router.send "openObject", context


App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.search.jrg"

    egbil: Em.Route.extend
      route: "/egbil"
      initialState: "search"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})

      doRightPanelAction: (router, context) ->
        action = context.context.get("type")
        objectList = context.view.get("controller.rightPanelSelectedObjects")
        router.get("egbilController").rightPanelAction action, objectList

      showChange: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        #TODO: search for changes related with context (changes tab is missing now)

      doSearch: (router, context) ->
        Em.assert "doSearch context must be jQuery.Event", context instanceof jQuery.Event
        searchArgs = context.view.getSearchArgs()
        router.get("egbilSearchController").doSearch searchArgs
      search: RouteWithParentMemory.extend
        route: "/szukaj"
        initialState: "jrg"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilSearch"})

        jrg: RouteWithParentMemory.extend
          route: "/jrg"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrg"})

        jrb: RouteWithParentMemory.extend
          route: "/jrb"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrb"})

        jrl: RouteWithParentMemory.extend
          route: "/jrl"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrl"})

        oldJrg: RouteWithParentMemory.extend
          route: "/OldJrg"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchOldJrg"})

        lot: RouteWithParentMemory.extend
          route: "/dzialki"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLot"})

        building: RouteWithParentMemory.extend
          route: "/budynki"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchBuilding"})

        local: RouteWithParentMemory.extend
          route: "/lokale"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLocal"})

        person: RouteWithParentMemory.extend
          route: "/osoby_fizyczne"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchPerson"})

        institution: RouteWithParentMemory.extend
          route: "/instytucje"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchInstitution"})

        group: RouteWithParentMemory.extend
          route: "/podmioty_grupowe"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchGroup"})

        landCommunity: RouteWithParentMemory.extend
          route: "/zarzady_wspolnot_gruntowych"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLandCommunity"})

        document: RouteWithParentMemory.extend
          route: "/dokumenty"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchDocument"})

      map: RouteWithParentMemory.extend
        route: "/mapa"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilMap"})

      openList: (router, context) ->
        router.get("egbilListController").openList context
      goToList: (router, context) ->
        router.transitionTo "list"
      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          if Em.empty router.get("egbilListController.content")
            router.transitionTo "egbil.search"
          else
            router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilList"})

      openObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").openObject context.get("_objectId"), context.get("_objectType")
      closeObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").closeObject context.get("_objectId"), context.get("_objectType")
      showObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").showObject context.get("_objectId"), context.get("_objectType")
      goToObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        objectType = context.get("_objectType")
        Em.assert "Can't go to object of undefined type", objectType?
        router.transitionTo ["object", objectType].join("."), context
      object: Em.Route.extend
        route: "/obiekt"

        index: Em.Route.extend
          route: "/"
          redirectsTo: "egbil.search"

        jrg: RouteWithObjectParam.extend
          route: "/jrg/:name/:id"
          objectOutletName: "egbilObjectJrg"

        jrb: RouteWithObjectParam.extend
          route: "/jrb/:name/:id"
          objectOutletName: "egbilObjectJrb"

        jrl: RouteWithObjectParam.extend
          route: "/jrl/:name/:id"
          objectOutletName: "egbilObjectJrl"

        oldJrg: RouteWithObjectParam.extend
          route: "/oldJrg/:name/:id"
          objectOutletName: "egbilObjectOldJrg"

        document: RouteWithObjectParam.extend
          route: "/dokument/:name/:id"
          objectOutletName: "egbilObjectDocument"

        lot: RouteWithObjectParam.extend
          route: "/lot/:name/:id"
          objectOutletName: "egbilObjectLot"

        building: RouteWithObjectParam.extend
          route: "/building/:name/:id"
          objectOutletName: "egbilObjectBuilding"

        local: RouteWithObjectParam.extend
          route: "/local/:name/:id"
          objectOutletName: "egbilObjectLocal"

        person: RouteWithObjectParam.extend
          route: "/person/:name/:id"
          objectOutletName: "egbilObjectPerson"

        institution: RouteWithObjectParam.extend
          route: "/institution/:name/:id"
          objectOutletName: "egbilObjectInstitution"

        group: RouteWithObjectParam.extend
          route: "/group/:name/:id"
          objectOutletName: "egbilObjectGroup"

        landCommunity: RouteWithObjectParam.extend
          route: "/landCommunity/:name/:id"
          objectOutletName: "egbilObjectLandCommunity"
          
      openTerrainCategoryReport: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        args = decodeURIComponent($.param({object: context}))
        url = "/getTerrainCategorySummary?#{args}"
        window.open(url)

      openReservation: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        args = decodeURIComponent($.param(context))
        url = "/getReservation?#{args}"
        window.open(url)

      openCustomReport: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        args = decodeURIComponent($.param(context))
        url = "/getCustomReport?#{args}"
        window.open(url)

      openDifferenceReport: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        args = decodeURIComponent($.param(context))
        url = "/getDifferenceReport?#{args}"
        window.open(url)

      showScan: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        args = decodeURIComponent($.param(context))
        url = "/getScan?#{args}"
        window.open(url)

    changes: Em.Route.extend
      route: "/zmiany"
      initialState: "search"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "change"})

      doSearch: (router, context) ->
        Em.assert "doSearch context must be jQuery.Event", context instanceof jQuery.Event
        searchArgs = context.view.getSearchArgs()
        router.get("changeSearchController").doSearch searchArgs
      search: RouteWithParentMemory.extend
        route: "/szukaj"
        connectOutlets: (router) ->
          router.get("changeController").connectOutlet({outletName: "change", name: "changeSearch"})

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "print"})
