App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    index: Em.Route.extend
      route: "/"
      redirectsTo: "egbil.wyszukaj.jrgib"

    egbil: Em.Route.extend
      route: "/egbil"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationContent", name: "egbilContent"})
      #DBG: clear 'applicationContent' to see if it works
      exit: (router) ->
        router.get('applicationController').set('applicationContent', null);

      wyszukaj: Em.Route.extend
        route: "/wyszukaj"
        connectOutlets: (router) ->
          router.get("egbilContentController").connectOutlet({outletName: "egbilContent", name: "egbilSearch"})
        #DBG: clear 'egbilContent' to see if it works
        exit: (router) ->
          router.get('egbilContentController').set('egbilContent', null);

        jrgib: Em.Route.extend
          route: "/jrgib"

        jrb: Em.Route.extend
          route: "/jrb"

        jrl: Em.Route.extend
          route: "/jrl"

        jrg: Em.Route.extend
          route: "/jrg"

      mapa: Em.Route.extend
        route: "/mapa"

      test: Em.Route.extend
        route: "/test"

    zmiany: Em.Route.extend
      route: "/zmiany"

    wydruki: Em.Route.extend
      route: "/wydruki"
