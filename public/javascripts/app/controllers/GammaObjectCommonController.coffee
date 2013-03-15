App.GammaObjectCommonController = Em.Controller.extend
  needs: ["gamma"]
  content: null
  
  fetchDataCallback: (fetchQueue, type) -> 
    @get("controllers.gamma").fetchDataCallback(fetchQueue, type)
