App.GammaObjectCommonController = Em.Controller.extend
  content: null
  
  fetchDataCallback: (fetchQueue, type) -> 
    @get("target.gammaController").fetchDataCallback(fetchQueue, type)
