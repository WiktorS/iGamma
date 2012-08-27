App.EgbilController = Em.Controller.extend
  objects: Em.A()

  showObject: (objectName) ->
    @objects.addObject objectName
    App.router.send "goToObject", Ember.Object.create {objectName: objectName}

  closeObject: (objectName) ->
    idx = @objects.indexOf objectName
    @objects.removeObject objectName
    if @objects.length > 0
      idx-- while idx >= @objects.length
      selectObjectName = @objects[idx]
      App.router.send "goToObject", Ember.Object.create {objectName: selectObjectName}
    else
      App.router.transitionTo "egbil.list"
