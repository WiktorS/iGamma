App.EgbilObjectCommonController = Em.ObjectController.extend
  content: null
  
  fetchDataCallback: (fetchQueue, type) -> 
    @get("target.egbilController").fetchDataCallback(fetchQueue, type)
