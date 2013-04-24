App.EgbilSearchController = App.GammaSearchController.extend
  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView
  type: (->
    currentHandlerInfos = @get "router.router.currentHandlerInfos"
    #looks like currentHandlerInfo is not Ember.Object so accessing it directly
    currentHandlerInfos[currentHandlerInfos.length-1].name?.split(".")[1]
    ).property("router.url")
