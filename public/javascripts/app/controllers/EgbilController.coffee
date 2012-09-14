App.EgbilController = Em.Controller.extend
  objects: Em.A()

  getObject: (objectType, objectName) ->
    @objects.filterProperty("name", objectName).findProperty("type", objectType)

  showObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    App.router.send "goToObject", object if !Em.empty object

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

  openObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    if Em.empty object
      $.ajax
        url: "/getEgbilObject.json"
        data:
          type: objectType
          name: objectName
        success: (data) =>
          if !Em.empty data
            content = App.EgbilObjectModel.create()
            content.registerUnit = App.Common.toModel.call(App.EgbilObjectRegisterUnitModel, data.registerUnit)
            content.shares = data.shares.map(App.Common.toModel, App.EgbilObjectShareModel)
            content.lots = data.lots.map(App.Common.toModel, App.EgbilObjectLotModel)
            content.buildings = data.buildings.map(App.Common.toModel, App.EgbilObjectBuildingModel)
            content.locals = data.locals.map(App.Common.toModel, App.EgbilObjectLocalModel)
            object = App.EgbilObjectInfo.create
              name: objectName
              type: objectType
              content: content
            @objects.addObject object
            App.router.send "goToObject", object
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      App.router.send "goToObject", object
