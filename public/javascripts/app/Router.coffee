RouteWithParentMemory = Em.Route.extend
  enter: (router) -> @parentState.set 'initialState', @name

App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.search.jrgib"

    egbil: Em.Route.extend
      route: "/egbil"
      initialState: "wyszukaj"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})

      search: RouteWithParentMemory.extend
        route: "/wyszukaj"
        initialState: "jrgib"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilSearch"})

        jrgib: RouteWithParentMemory.extend
          route: "/jrgib"
          connectOutlets: (router) ->
            router.get("egbilSearchController").connectOutlet({outletName: "egbilSearch", name: "egbilSearchJrgib"})
            router.get("egbilSearchJgribController").set("content", App.MojModel.create())

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

      map: RouteWithParentMemory.extend
        route: "/mapa"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilMap"})

      list: RouteWithParentMemory.extend
        route: "/lista"
        connectOutlets: (router) ->
          router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilList"})

    changes: Em.Route.extend
      route: "/zmiany"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "changes"})

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "prints"})
