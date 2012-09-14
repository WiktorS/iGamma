RouteWithParentMemory = Em.Route.extend
  enter: (router) -> @parentState.set 'initialState', @name


RouteWithObjectParam = Em.Route.extend
  objectName: null
  objectType: (-> @get "name").property("name")
  objectOutletName: null
  getObject: ->
    App.router.get("egbilController").getObject @get("objectType"), @get("objectName")
  deserialize: (router, params) ->
    App.EgbilObjectInfo.create
      type: @get "objectType"
      name: params.name
  serialize: (router, context) ->
    App.EgbilObjectInfo.create
      type: context.get "type"
      name: context.get "name"
  connectOutlets: (router, context) ->
    @set "objectName", context.get "name"
    #@set "objectType", context.get "type" #actually we can't do this, because type is bind with state name
    object = @getObject()
    if !Em.empty object
      router.get("egbilController").connectOutlet(
        outletName: "egbil"
        name: @get("objectOutletName")
        context: object.content
      )
    else
      router.transitionTo "egbil.search"


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

        lots: RouteWithParentMemory.extend
          route: "/dzialki"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLots"})

        buildings: RouteWithParentMemory.extend
          route: "/budynki"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchBuildings"})

        locals: RouteWithParentMemory.extend
          route: "/lokale"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLocals"})

        individuals: RouteWithParentMemory.extend
          route: "/osoby_fizyczne"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchIndividuals"})

        institutions: RouteWithParentMemory.extend
          route: "/instytucje"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchInstitutions"})

        groups: RouteWithParentMemory.extend
          route: "/podmioty_grupowe"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchGroups"})

        landCommunities: RouteWithParentMemory.extend
          route: "/zarzady_wspolnot_gruntowych"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchLandCommunities"})

        documents: RouteWithParentMemory.extend
          route: "/dokumenty"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchDocuments"})

      map: RouteWithParentMemory.extend
        route: "/mapa"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilMap"})

      goToList: (router, context) ->
        if context?
          controller = router.get "egbilListController"
          controller.set "content", context.get "content"
          controller.set "columns", context.get "columns"
        router.transitionTo "list"
      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          if Em.empty(router.get("egbilListController").content)
            router.transitionTo "egbil.search"
          else
            router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilList"})

      openObject: (router, context) ->
        router.get("egbilController").openObject context.get("type"), context.get("name")
      closeObject: (router, context) ->
        router.get("egbilController").closeObject context.get("type"), context.get("name")
      showObject: (router, context) ->
        router.get("egbilController").showObject context.get("type"), context.get("name")
      goToObject: (router, context) ->
        router.transitionTo ["object", context.get "type"].join("."), context

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

    changes: Em.Route.extend
      route: "/zmiany"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "changes"})

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "prints"})
