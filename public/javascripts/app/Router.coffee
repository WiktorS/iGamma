App.Route = Em.Route.extend
  enter: (router) -> @parentState.set 'initialState', @name

App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: App.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"

    egbil: App.Route.extend
      route: "/egbil"
      initialState: "wyszukaj"
      connectOutlets: (router) -> router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})

      wyszukaj: App.Route.extend
        route: "/wyszukaj"
        initialState: "jrgib"
        connectOutlets: (router) -> router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilSearch"})

        jrgib: App.Route.extend
          route: "/jrgib"

        jrb: App.Route.extend
          route: "/jrb"

        jrl: App.Route.extend
          route: "/jrl"

        jrg: App.Route.extend
          route: "/jrg"

      mapa: App.Route.extend
        route: "/mapa"

      lista: App.Route.extend
        route: "/lista"

    changes: App.Route.extend
      route: "/zmiany"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "changes"})

    prints: App.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "prints"})
