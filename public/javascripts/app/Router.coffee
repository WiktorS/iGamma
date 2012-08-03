App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"

    egbil: Em.Route.extend
      route: "/egbil"
      initialState: "wyszukaj"
      connectOutlets: (router) -> router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})
      exit: (router) -> router.get('applicationController').set('applicationPage', null) #DBG

      wyszukaj: Em.Route.extend
        route: "/wyszukaj"
        initialState: "jrgib"
        connectOutlets: (router) -> router.get("egbilController").connectOutlet({outletName: "egbil", name: "egbilSearch"})

        jrgib: Em.Route.extend
          route: "/jrgib"
          enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name

        jrb: Em.Route.extend
          route: "/jrb"
          enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name

        jrl: Em.Route.extend
          route: "/jrl"
          enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name

        jrg: Em.Route.extend
          route: "/jrg"
          enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name

      mapa: Em.Route.extend
        route: "/mapa"
        exit: (router) -> router.get('egbilController').set('egbil', null) #DBG

      test: Em.Route.extend
        route: "/test"
        exit: (router) -> router.get('egbilController').set('egbil', null) #DBG

    changes: Em.Route.extend
      route: "/zmiany"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "changes"})

    prints: Em.Route.extend
      route: "/wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "prints"})
