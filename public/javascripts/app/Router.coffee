App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    showEgbilPage: Em.Router.transitionTo "app.egbil.wyszukaj.jrgib"
    showZmianyPage: Em.Router.transitionTo "app.zmiany"
    showWydrukiPage: Em.Router.transitionTo "app.wydruki"


    index: Em.Route.extend
      route: "/"
      redirectsTo: "app.egbil.wyszukaj.jrgib"

    app: Em.Route.extend
      route: "/app"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})


      egbil: Em.Route.extend
        route: "/egbil"

        wyszukaj: Em.Route.extend
            route: "/wyszukaj"

            jrgib: Em.Route.extend
              route: "/jrgib"

      zmiany: Em.Route.extend
        route: "/zmiany"

      wydruki: Em.Route.extend
        route: "/wydruki"
