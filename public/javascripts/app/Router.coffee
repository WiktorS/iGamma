App.Router = Em.Router.extend
  location: "hash"
  enableLogging: false
  root: Ember.Route.extend

    index: Ember.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"

    egbil: Ember.Route.extend
      route: "/egbil"

      wyszukaj: Ember.Route.extend
        route: "/wyszukaj"

        jrgib: Ember.Route.extend
          route: "/jrgib"
          showEgbilPage: Ember.Router.transitionTo "egbil.wyszukaj.jrgib"
          showZmianyPage: Ember.Router.transitionTo "zmiany"
          showWydrukiPage: Ember.Router.transitionTo "wydruki"
          connectOutlets: (router) ->
            controller = router.get "applicationController"
            controller.currentState = "egbil"
            controller.connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})

    zmiany: Ember.Route.extend
      route: "/zmiany"
      showEgbilPage: Ember.Router.transitionTo "egbil.wyszukaj.jrgib"
      showZmianyPage: Ember.Router.transitionTo "zmiany"
      showWydrukiPage: Ember.Router.transitionTo "wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})

    wydruki: Ember.Route.extend
      route: "/wydruki"
      showEgbilPage: Ember.Router.transitionTo "egbil.wyszukaj.jrgib"
      showZmianyPage: Ember.Router.transitionTo "zmiany"
      showWydrukiPage: Ember.Router.transitionTo "wydruki"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})
