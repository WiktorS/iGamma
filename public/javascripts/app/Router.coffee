App.Router = Em.Router.extend
  location: "hash"
  enableLogging: false
  root: Ember.Route.extend
    index: Ember.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"


    egbil: Ember.Route.extend
      route: "/egbil"

      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})

      wyszukaj: Ember.Route.extend
        route: "/wyszukaj"

        jrgib: Ember.Route.extend
          route: "/jrgib"
