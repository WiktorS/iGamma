App.EgbilController = Em.Controller.extend
  objects: Em.A()

  getObject: (objectType, objectName) ->
    @objects.filterProperty("value", objectName).findProperty("valueType", objectType)

  showObject: (contextObject) ->
    objectType = contextObject.get "valueType"
    objectName = contextObject.get "value"
    object = @getObject objectType, objectName
    App.router.send "goToObject", object if !Em.empty object

  closeObject: (contextObject) ->
    objectType = contextObject.get "valueType"
    objectName = contextObject.get "value"
    Em.assert "Missing object type & name", objectType? && objectName?
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

  openObject: (contextObject) ->
    objectType = contextObject.get "valueType"
    objectName = contextObject.get "value"
    Em.assert "Missing object type & name", objectType? && objectName?
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
            content.person = App.Common.toModel.call(App.EgbilObjectPersonModel, data.person)
            content.institution = App.Common.toModel.call(App.EgbilObjectInstitutionModel, data.institution)
            content.document = App.Common.toModel.call(App.EgbilObjectDocumentModel, data.document)
            content.registerUnit = App.Common.toModel.call(App.EgbilObjectRegisterUnitModel, data.registerUnit)
            content.shares = data.shares.map(App.Common.toModel, App.EgbilObjectShareModel)
            content.lots = data.lots.map(App.Common.toModel, App.EgbilObjectLotModel)
            content.buildings = data.buildings.map(App.Common.toModel, App.EgbilObjectBuildingModel)
            content.locals = data.locals.map(App.Common.toModel, App.EgbilObjectLocalModel)
            content.landCommunities = data.landCommunities.map(App.Common.toModel, App.EgbilObjectLandCommunityModel)
            content.changes = data.changes.map(App.Common.toModel, App.EgbilObjectChangeModel)
            object = App.StandardTableCellModel.create contextObject,
              content: content
              groupName: @getGroupName objectType
            @objects.addObject object
            App.router.send "goToObject", object
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      App.router.send "goToObject", object

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
      when "person" then "Osoba fizyczna"
      when "institution" then "Instytucja"
