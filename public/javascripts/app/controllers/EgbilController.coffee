App.EgbilController = Em.Controller.extend
  objects: Em.A()

  getObject: (objectType, objectName) ->
    @objects.filterProperty("objectName", objectName).findProperty("objectType", objectType)

  showObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    @get("target").send "goToObject", object if !Em.empty object

  closeObject: (objectType, objectName) ->
    Em.assert "Cannot close object without type & name", objectType? && objectName?
    object = @getObject objectType, objectName
    if !Em.empty object
      idx = @objects.indexOf object
      @objects.removeObject object
      currentStateObjectName =  App.router.get("currentState.objectName")
      if currentStateObjectName == objectName
        if @objects.length > 0
          idx-- while idx >= @objects.length
          @get("target").send "goToObject", @objects[idx]
        else if @get("target").egbilListController.content
          @get("target").transitionTo "egbil.list"
        else
          @get("target").transitionTo "egbil.search"

  openObject: (objectType, objectName) ->
    Em.assert "Can't open object of undefined type", objectType?
    Em.assert "Can't open object of undefined name", objectName?
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
            content.document = App.Common.toModel.call(App.EgbilObjectDocumentModel, data.document)
            content.registerUnit = App.Common.toModel.call(App.EgbilObjectRegisterUnitModel, data.registerUnit)
            content.shares = data.shares.map(App.Common.toModel, App.EgbilObjectShareModel)
            content.lots = data.lots.map(App.Common.toModel, App.EgbilObjectLotModel)
            content.buildings = data.buildings.map(App.Common.toModel, App.EgbilObjectBuildingModel)
            content.locals = data.locals.map(App.Common.toModel, App.EgbilObjectLocalModel)
            content.changes = data.changes.map(App.Common.toModel, App.EgbilObjectChangeModel)
            object = Em.Object.create content,
              objectType: objectType
              objectName: objectName
              groupName: @getGroupName objectType
            @objects.addObject object
            @showObject objectType, objectName
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      @showObject objectType, objectName

  getGroupName: (group) ->
    switch group
      when "jrgib" then "Jednostka Rejestrowa Gruntów i Budynków"
      when "jrb" then "Jednostka Rejestrowa Budynków"
      when "jrl" then "Jednostka Rejestrowa Lokali"
      when "jrg" then "Stara Jednostka Rejestrowa Gruntów"
      when "lot" then "Działka"
      when "building" then "Budynek"
      when "local" then "Lokal samodzielny"
      when "doc" then "Dokument"
