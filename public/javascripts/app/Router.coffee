App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    showEgbilPage: (router) -> router.transitionTo "app.egbil."+router.get("egbilController").get("currentState")
    showChangesPage: (router) -> router.transitionTo "app.changes"
    showPrintsPage: (router) -> router.transitionTo "app.prints"


    index: Em.Route.extend
      route: "/"
      redirectsTo: "app.egbil.search.jrgib"

    app: Em.Route.extend
      route: "/app"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})


      egbil: Em.Route.extend
        route: "/egbil"
        connectOutlets: (router) ->
          router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})

        search: Em.Route.extend
            route: "/wyszukaj"

            jrgib: Em.Route.extend
              route: "/jrgib"
              enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name

            jrl: Em.Route.extend
              route: "/jrl"
              enter: (router) -> router.get("egbilController").set "currentState", this.parentState.name+"."+this.name


      changes: Em.Route.extend
        route: "/zmiany"
        connectOutlets: (router) ->
          router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "changes"})


      prints: Em.Route.extend
        route: "/wydruki"
        connectOutlets: (router) ->
          router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "prints"})
