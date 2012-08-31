App.EgbilController = Em.Controller.extend
  objects: Em.A()

  getObject: (objectType, objectName) ->
    @objects.filterProperty("name", objectName).findProperty("type", objectType)

  showObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    if Em.empty object
      object = App.EgbilObjectInfo.create
        name: objectName
        type: objectType
      @objects.addObject object
    App.router.send "goToObject", object

  closeObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    if !Em.empty object
      idx = @objects.indexOf object
      @objects.removeObject object
      currentStateObjectName =  App.router.get("currentState.objectName")
      if currentStateObjectName == objectName
        if @objects.length > 0
          idx-- while idx >= @objects.length
          App.router.send "goToObject", @objects[idx]
        else
          App.router.transitionTo "egbil.list"
