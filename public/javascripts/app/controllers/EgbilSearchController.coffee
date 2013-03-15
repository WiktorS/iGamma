App.EgbilSearchController = App.GammaSearchController.extend
  type: (->
    currentHandlerInfos = @get "target.router.currentHandlerInfos"
    #looks like currentHandlerInfo is not Ember.Object so accessing it directly
    currentHandlerInfos[currentHandlerInfos.length-1].name?.split(".")[1]
    ).property("target.url")
