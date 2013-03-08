App.EgbilSearchController = App.GammaSearchController.extend
  type: (->
    @get "target.currentState.name"
    ).property("target.currentState.name")
