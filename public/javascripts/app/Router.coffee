RouteWithParentMemory = Em.Route.extend
  enter: (router) -> @parentState.set 'initialState', @name


RouteWithObjectParam = Em.Route.extend
  objectName: null
  objectType: (-> @get "name").property("name")
  objectOutletName: null
  deserialize: (router, params) ->
    Em.Object.create
      objectName: params.name
      objectType: @get "objectType"
  serialize: (router, context) ->
    Em.Object.create
      name: context.get "objectName"
  connectOutlets: (router, context) ->
    Em.assert "Object type doesn't match state type", @get("objectType") == context.get("objectType")
    @set "objectName", context.get "objectName"
    object = router.get("egbilController").getObject @get("objectType"), @get("objectName")
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
      router.send "openObject", Em.Object.create
         objectType: @get "objectType"
         objectName: @get "objectName"


App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.search.jrgib"

    egbil: Em.Route.extend
      route: "/egbil"
      initialState: "search"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})

      doRightPanelAction: (router, context) ->
        router.get("egbilController").rightPanelAction context.context, context.view

      showChanges: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        #TODO: search for changes related with context (changes tab is missing now)

      doSearch: (router, context) ->
        view = if context instanceof jQuery.Event then context.view else context
        router.get("egbilSearchController").search(view)
      search: RouteWithParentMemory.extend
        route: "/szukaj"
        initialState: "jrgib"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilSearch"})

        jrgib: RouteWithParentMemory.extend
          route: "/jrgib"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrgib"})

        jrb: RouteWithParentMemory.extend
          route: "/jrb"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrb"})

        jrl: RouteWithParentMemory.extend
          route: "/jrl"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrl"})

        jrg: RouteWithParentMemory.extend
          route: "/jrg"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrg"})

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

        individual: RouteWithParentMemory.extend
          route: "/osoby_fizyczne"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchIndividual"})

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

      goToList: (router, context) ->
        if context?
          controller = router.get "egbilListController"
          controller.set "content", context.get "content"
          controller.set "columns", context.get "columns"
          controller.set "type", context.get "type"
          controller.set "title", context.get "title"
        router.transitionTo "list"
      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          if Em.empty(router.get("egbilListController").content)
            router.transitionTo "egbil.search"
          else
            router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilList"})

      openObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").openObject context.get("objectType"), context.get("objectName")
      closeObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").closeObject context.get("objectType"), context.get("objectName")
      showObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        router.get("egbilController").showObject context.get("objectType"), context.get("objectName")
      goToObject: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        objectType = context.get("objectType")
        Em.assert "Can't go to object of undefined type", objectType?
        router.transitionTo ["object", objectType].join("."), context
      object: Em.Route.extend
        route: "/obiekt"

        index: Em.Route.extend
          route: "/"
          redirectsTo: "egbil.search"

        jrgib: RouteWithObjectParam.extend
          route: "/jrgib/:name"
          objectOutletName: "egbilObjectJrgib"

        jrb: RouteWithObjectParam.extend
          route: "/jrb/:name"
          objectOutletName: "egbilObjectJrb"

        jrl: RouteWithObjectParam.extend
          route: "/jrl/:name"
          objectOutletName: "egbilObjectJrl"

        jrg: RouteWithObjectParam.extend
          route: "/jrg/:name"
          objectOutletName: "egbilObjectJrg"

        document: RouteWithObjectParam.extend
          route: "/dokument/:name"
          objectOutletName: "egbilObjectDocument"

      openTerrainCategorySummary: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        url = "/getTerrainCategorySummary?objectType=#{context.get "objectType"}&objectName=#{context.get "objectName"}"
        window.open(url)

      openReservation: (router, context) ->
        context = context.context if context instanceof jQuery.Event
        url = "/getReservation?objectType=#{context.get "objectType"}&objectName=#{context.get "objectName"}"
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

    changes: Em.Route.extend
      route: "/zmiany"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "change"})

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "print"})
