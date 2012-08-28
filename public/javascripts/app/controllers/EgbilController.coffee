App.EgbilController = Em.Controller.extend
  objects: Em.A()

  showObject: (objectName) ->
    @objects.addObject objectName
    App.router.send "goToObject", Ember.Object.create {objectName: objectName}

  closeObject: (objectName) ->
    currentStateObjectName =  App.router.get("currentState")?.get("objectName")?.valueOf()
    idx = @objects.indexOf objectName
    @objects.removeObject objectName
    if currentStateObjectName == objectName
      if @objects.length > 0
        idx-- while idx >= @objects.length
        App.router.send "goToObject", Ember.Object.create {objectName: @objects[idx]}
      else
        App.router.transitionTo "egbil.list"
