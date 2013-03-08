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
    object = router.get("gammaController").getObject @get("objectId"), @get("objectType")
    if !Em.empty object
      router.get("gammaController").connectOutlet
        outletName: "content"
        name: "gammaObject"
        context: object
      router.get("gammaObjectController").connectOutlet
        outletName: "gammaObject"
        name: @get("objectOutletName")
        context: object
    else
      router.send "openObject", context


#Ember redirectsTo does not pass context
RouteWithObjectParamRedirect = RouteWithObjectParam.extend
  redirectPath: null
  connectOutlets: (router, context) ->
    Em.assert "Object type doesn't match state type", @get("objectType") == context.get("_objectType")
    router.transitionTo @get("redirectPath"), context


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
        router.get("applicationController").connectOutlet
          outletName: "applicationPage"
          viewClass: App.get "EgbilView"
          controller: router.get "gammaController"

      doRightPanelAction: (router, context) ->
        action = context.context.get("type")
        objectList = context.view.get("controller.rightPanelSelectedObjects")
        router.get("gammaController").rightPanelAction action, objectList

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
          router.get("gammaController").connectOutlet({outletName: "content", name: "egbilSearch"})

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
          router.get("gammaController").connectOutlet
            outletName: "content"
            name: "egbilMap"

      openList: (router, context) ->
        router.get("egbilListController").openList context
      goToList: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        if (context instanceof Em.Object)
          router.set "egbilListController.type", context.get("type")
          router.set "egbilListController.content", context.get("list")
        router.transitionTo "list"
      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          if Em.empty router.get("egbilListController.content")
            router.transitionTo "egbil.search"
          else
            router.get("gammaController").connectOutlet
              outletName: "content"
              viewClass: App.get "GammaListView"
              controller: router.get "egbilListController"

      openObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").openObject context.get("_objectId"), context.get("_objectType")
      closeObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").closeObject context.get("_objectId"), context.get("_objectType")
      showObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").showObject context.get("_objectId"), context.get("_objectType")
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
          route: "/jednostka rejestrowa gruntów i budynków/:name/:id"
          objectOutletName: "egbilObjectJrg"

        jrb: RouteWithObjectParam.extend
          route: "/jednostka rejestrowa budynków/:name/:id"
          objectOutletName: "egbilObjectJrb"

        jrl: RouteWithObjectParam.extend
          route: "/jednostka rejestrowa lokali/:name/:id"
          objectOutletName: "egbilObjectJrl"

        oldJrg: RouteWithObjectParam.extend
          route: "/stara jednostka rejestrowa gruntów/:name/:id"
          objectOutletName: "egbilObjectOldJrg"

        document: RouteWithObjectParam.extend
          route: "/dokument/:name/:id"
          objectOutletName: "egbilObjectDocument"

        lot: RouteWithObjectParam.extend
          route: "/działka/:name/:id"
          objectOutletName: "egbilObjectLot"

        building: RouteWithObjectParam.extend
          route: "/budynek/:name/:id"
          objectOutletName: "egbilObjectBuilding"

        local: RouteWithObjectParam.extend
          route: "/lokal/:name/:id"
          objectOutletName: "egbilObjectLocal"

        person: RouteWithObjectParam.extend
          route: "/osoba fizyczne/:name/:id"
          objectOutletName: "egbilObjectPerson"

        institution: RouteWithObjectParam.extend
          route: "/instytucja/:name/:id"
          objectOutletName: "egbilObjectInstitution"

        group: RouteWithObjectParam.extend
          route: "/podmiot grupowy/:name/:id"
          objectOutletName: "egbilObjectGroup"

        landCommunity: RouteWithObjectParam.extend
          route: "/zarząd wspólnoty gruntowej/:name/:id"
          objectOutletName: "egbilObjectLandCommunity"

        change: RouteWithObjectParamRedirect.extend
          route: "/zmiana/:name/:id"
          redirectPath: "changes.object.change"
          
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
        router.get("applicationController").connectOutlet
          outletName: "applicationPage"
          viewClass: App.get "ChangesView"
          controller: router.get "gammaController"

      doSearch: (router, context) ->
        Em.assert "doSearch context must be jQuery.Event", context instanceof jQuery.Event
        searchArgs = context.view.getSearchArgs()
        router.get("changesSearchController").doSearch searchArgs
      search: RouteWithParentMemory.extend
        route: "/szukaj"
        connectOutlets: (router) ->
          router.get("gammaController").connectOutlet({outletName: "content", name: "changesSearch"})

      goToList: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        if (context instanceof Em.Object)
          router.set "changesListController.type", context.get("type")
          router.set "changesListController.content", context.get("list")
        router.transitionTo "list"
      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          if Em.empty router.get("changesListController.content")
            router.transitionTo "changes.search"
          else
            router.get("gammaController").connectOutlet
              outletName: "content"
              viewClass: App.get "GammaListView"
              controller: router.get "changesListController"

      openObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").openObject context.get("_objectId"), context.get("_objectType")
      closeObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").closeObject context.get("_objectId"), context.get("_objectType")
      showObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("gammaController").showObject context.get("_objectId"), context.get("_objectType")
      goToObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        objectType = context.get("_objectType")
        Em.assert "Can't go to object of undefined type", objectType?
        router.transitionTo ["object", objectType].join("."), context
      object: Em.Route.extend
        route: "/obiekt"

        index: Em.Route.extend
          route: "/"
          redirectsTo: "change.search"

        jrg: RouteWithObjectParamRedirect.extend
          route: "/jednostka rejestrowa gruntów i budynków/:name/:id"
          redirectPath: "egbil.object.jrg"

        jrb: RouteWithObjectParamRedirect.extend
          route: "/jednostka rejestrowa budynków/:name/:id"
          redirectPath: "egbil.object.jrb"

        jrl: RouteWithObjectParamRedirect.extend
          route: "/jednostka rejestrowa lokali/:name/:id"
          redirectPath: "egbil.object.jrl"

        oldJrg: RouteWithObjectParamRedirect.extend
          route: "/stara jednostka rejestrowa gruntów/:name/:id"
          redirectPath: "egbil.object.oldJrg"

        document: RouteWithObjectParamRedirect.extend
          route: "/dokument/:name/:id"
          redirectPath: "egbil.object.document"

        lot: RouteWithObjectParamRedirect.extend
          route: "/działka/:name/:id"
          redirectPath: "egbil.object.lot"

        building: RouteWithObjectParamRedirect.extend
          route: "/budynek/:name/:id"
          redirectPath: "egbil.object.building"

        local: RouteWithObjectParamRedirect.extend
          route: "/lokal/:name/:id"
          redirectPath: "egbil.object.local"

        person: RouteWithObjectParamRedirect.extend
          route: "/osoba fizyczne/:name/:id"
          redirectPath: "egbil.object.person"

        institution: RouteWithObjectParamRedirect.extend
          route: "/instytucja/:name/:id"
          redirectPath: "egbil.object.institution"

        group: RouteWithObjectParamRedirect.extend
          route: "/podmiot grupowy/:name/:id"
          redirectPath: "egbil.object.group"

        landCommunity: RouteWithObjectParamRedirect.extend
          route: "/zarząd wspólnoty gruntowej/:name/:id"
          redirectPath: "egbil.object.landCommunity"

        change: RouteWithObjectParam.extend
          route: "/zmiana/:name/:id"
          objectOutletName: "changesObjectChange"

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "print"})
