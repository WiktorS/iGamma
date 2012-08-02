App.Router = Em.Router.extend
  location: "hash"
  enableLogging: true
  root: Em.Route.extend

    showEgbilPage: (router) ->
      v = router.get("applicationController").get("egbilState")
#      v = "app.egbil.wyszukaj." + v
      console.log v
      router.transitionTo ("app.egbil.wyszukaj."+v)
    showZmianyPage: Em.Router.transitionTo "app.zmiany"
    showWydrukiPage: (router) -> router.transitionTo "app.wydruki"


    index: Em.Route.extend
      route: "/"
      redirectsTo: "app.egbil.wyszukaj.jrgib"

    app: Em.Route.extend
      route: "/app"
      connectOutlets: (router) ->
        router.get("applicationController").connectOutlet({outletName: "applicationMenu", name: "applicationMenu"})


      egbil: Em.Route.extend
        route: "/egbil"
        connectOutlets: (router) ->
          router.get("applicationController").connectOutlet({outletName: "applicationPage", name: "egbil"})
#          router.get("egbilController")

        wyszukaj: Em.Route.extend
            route: "/wyszukaj"

            jrgib: Em.Route.extend
              route: "/jrgib"
              enter: (router) -> router.get("applicationController").set "egbilState", "jrgib"

            jrl: Em.Route.extend
              route: "/jrl"
              enter: (router) -> router.get("applicationController").set "egbilState", "jrl"

      zmiany: Em.Route.extend
        route: "/zmiany"

      wydruki: Em.Route.extend
        route: "/wydruki"
