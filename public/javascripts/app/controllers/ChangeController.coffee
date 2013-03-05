App.ChangeController = Em.Controller.extend
  objectList: Em.A()
  fetchMethod:
    building: "getBuildings"
    document: "getDocuments"
    group: "getGroups"
    person: "getPersons"
    institution: "getInstitutions"
    jrg: "getJrg"
    jrb: "getJrb"
    jrl: "getJrl"
    oldJrg: "getOldJrg"
    landCommunity: "getLandCommunities"
    local: "getLocals"
    lot: "getLots"
    address: "getAddresses"
    share: "getShares"
    change: "getChanges"
  objectModel:
    building: App.EgbilObjectBuildingModel
    document: App.EgbilObjectDocumentModel
    group: App.EgbilObjectGroupModel
    person: App.EgbilObjectPersonModel
    institution: App.EgbilObjectInstitutionModel
    jrg: App.EgbilObjectRegisterUnitModel
    jrb: App.EgbilObjectRegisterUnitModel
    jrl: App.EgbilObjectRegisterUnitModel
    oldJrg: App.EgbilObjectRegisterUnitModel
    landCommunity: App.EgbilObjectLandCommunityModel
    local: App.EgbilObjectLocalModel
    lot: App.EgbilObjectLotModel
    address: App.EgbilObjectAddressModel
    share: App.EgbilObjectShareModel
    change: App.EgbilObjectChangeModel

  getObject: (objectId, objectType) ->
    @get("objectList").filterProperty("_objectId", objectId).findProperty("_objectType", objectType)

  showObject: (objectId, objectType) ->
    object = @getObject objectId, objectType
    @get("target").send "goToObject", object if !Em.empty object

  closeObject: (objectId, objectType) ->
    Em.assert "Cannot close object without type", objectType?
    Em.assert "Cannot close object without id", objectId?
    object = @getObject objectId, objectType
    Em.assert "Object to close not found ('#{objectType}:#{objectId}')", object
    idx = @get("objectList").indexOf object
    @get("objectList").removeObject object
    currentStateObjectId =  App.router.get("currentState.objectId")
    if currentStateObjectId == objectId
      if @get("objectList").length > 0
        idx-- while idx >= @get("objectList").length
        @get("target").send "goToObject", @get("objectList.#{idx}")
      else if @get("target").egbilListController.content
        @get("target").transitionTo "egbil.list"
      else
        @get("target").transitionTo "egbil.search"

  openObject: (objectId, objectType) ->
    Em.assert "Can't open object of undefined id", !!objectId
    Em.assert "Can't open object of undefined type", !!objectType
    object = @getObject objectId, objectType
    if !object
      jsonMethod = @get "fetchMethod.#{objectType}"
      Em.assert "fetchMethod is undefinned for object type: '#{objectType}'", !!jsonMethod
      $.ajax
        url: "/#{jsonMethod}.json"
        data:
          idList: [objectId]
        success: (data) =>
          if Em.isArray data
            Em.assert "Should receive data for 1 object, but got #{data.length}", data.length == 1
            contentClass = @get "objectModel.#{objectType}"
            mappedData = data.map(App.Common.toModel, contentClass)
            item.set "_dataStatus", App.EgbilObjectStatus.READY for item in mappedData
            Em.run.sync() #sync bindings!
            @get("objectList").addObject mappedData[0]
            @showObject objectId, objectType
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      @showObject objectId, objectType

  fetchDataCallback: (fetchQueue, type)->
    jsonMethod = @get "target.egbilController.fetchMethod.#{type}"
    Em.assert "fetchMethod undefinned for type: #{type}", jsonMethod
    idList = fetchQueue.map( (x)-> x.get "id")
    $.ajax
      url: "#{jsonMethod}.json"
      data:
        idList: idList
      success: (data) =>
        if Em.isArray data
          for item in data
            contentItems = fetchQueue.filter((x) -> item.id == x.get "id")
            Em.assert "Received data for item with id '#{item.id}', but did not found it in list content!", !!contentItems
            for contentItem in contentItems            
              contentClass = @get "objectModel.#{type}"
              mappedItem = App.Common.toModel.call(contentClass, item)
              Em.run.sync() #sync bindings!
              for own key,value of mappedItem
                # Em.assert "Model '#{(contentItem.get "constructor").toString()}' does not define member '#{key}'", "undefined" != typeof contentItem.get(key)
                contentItem.set key, value
              contentItem.set "_dataStatus", App.EgbilObjectStatus.READY
        return
      complete: (jqXHR, textStatus) =>
        #check for requested but not received rows
        for id in idList
          contentItems = fetchQueue.filter((x) -> id == x.get "id")
          for contentItem in contentItems
            if App.EgbilObjectStatus.READY != contentItem.get "_dataStatus"
              contentItem.set "_dataStatus", App.EgbilObjectStatus.ERROR
        return
