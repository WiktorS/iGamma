App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    showEgbilPage: Em.Router.transitionTo "egbil.wyszukaj.jrgib"
    showZmianyPage: Em.Router.transitionTo "zmiany"
    showWydrukiPage: Em.Router.transitionTo "wydruki"

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"

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
