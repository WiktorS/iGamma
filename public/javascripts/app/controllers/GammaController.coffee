App.GammaController = Em.Controller.extend
  needs: ["changesList", "egbilList"]

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView

  objectList: Em.A()
  rightPanelData:
    jrg: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KB", type: "kb", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategoryReport", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
#      Em.Object.create { name: "Dzierżawy", type: "leases", multiselect: false }
    ]
    jrb: [
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "change", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    jrl: [
      Em.Object.create { name: "Wypis z RL", type: "rl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "change", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    oldJrg: [
      Em.Object.create { name: "Wypis z RG", type: "rg", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "change", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    lot: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategoryReport", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Rezerwacja numerów", type: "reservation", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    building: [
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rezerwacja numerów", type: "reservation", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    local: [
      Em.Object.create { name: "Wypis z RL", type: "rl", multiselect: true }
    ]
    person: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategoryReport", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Działki", type: "lot", multiselect: true }
      Em.Object.create { name: "Budynki", type: "building", multiselect: true }
      Em.Object.create { name: "Lokale", type: "local", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    institution: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategoryReport", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Działki", type: "lot", multiselect: true }
      Em.Object.create { name: "Budynki", type: "building", multiselect: true }
      Em.Object.create { name: "Lokale", type: "local", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    group: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategoryReport", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Działki", type: "lot", multiselect: true }
      Em.Object.create { name: "Budynki", type: "building", multiselect: true }
      Em.Object.create { name: "Lokale", type: "local", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    document: [
      Em.Object.create { name: "Skan", type: "scan", multiselect: false }
      Em.Object.create { name: "Działki", type: "lot", multiselect: false }
      Em.Object.create { name: "Budynki", type: "building", multiselect: false }
      Em.Object.create { name: "Lokale", type: "local", multiselect: false }
      Em.Object.create { name: "Zmiany", type: "change", multiselect: false }
    ]
    change: [
      Em.Object.create { name: "Dokumenty", type: "document", multiselect: false }
      Em.Object.create { name: "Działki", type: "lot", multiselect: false }
      Em.Object.create { name: "Zawiadomienie o zmianie", type: "changeNotification", multiselect: false }
      Em.Object.create { name: "Różnice", type: "difference", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
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
    @get("target").send "goToObject", object if !Em.isEmpty object

  closeObject: (objectId, objectType) ->
    Em.assert "Cannot close object without type", objectType?
    Em.assert "Cannot close object without id", objectId?
    object = @getObject objectId, objectType
    Em.assert "Object to close not found ('#{objectType}:#{objectId}')", object
    idx = @get("objectList").indexOf object
    @get("objectList").removeObject object
    objectRoute = object.get "_objectRoute"
    if @get("router").isActive objectRoute, object
      if @get("objectList").length > 0
        idx-- while idx >= @get("objectList").length
        @get("target").send "goToObject", @get("objectList.#{idx}")
      #TODO: This should be done better - more universal
      if objectRoute.match /^egbil/
        if @get("controllers.egbilList.content")
          @transitionToRoute "egbil.egbilList"
        else
          @transitionToRoute "egbilSearch"
      else if objectRoute.match /^changes/
        if @get("controllers.changesList.content")
          @transitionToRoute "changes.changesList"
        else
          @transitionToRoute "changesSearch"
      else
        throw new Ember.Error "Unknown object route: #{objectRoute}"

  openObject: (objectId, objectType) ->
    Em.assert "Can't open object of undefined id", !!objectId
    Em.assert "Can't open object of undefined type", !!objectType
    object = @getObject objectId, objectType
    if !object
      jsonMethod = @get "fetchMethod.#{objectType}"
      Em.assert "fetchMethod is undefinned for object type: '#{objectType}'", !!jsonMethod
      $.ajax
        url: "#{jsonMethod}.json"
        data:
          idList: [objectId]
        success: (data) =>
          if Em.isArray data
            Em.assert "Should receive data for 1 object, but got #{data.length}", data.length == 1
            contentClass = @get "objectModel.#{objectType}"
            mappedData = data.map(App.Common.toModel, contentClass)
            item.set "_dataStatus", App.GammaObjectStatus.READY for item in mappedData
            Em.run.sync() #sync bindings!
            @get("objectList").addObject mappedData[0]
            @showObject objectId, objectType
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      @showObject objectId, objectType

  fetchDataCallback: (fetchQueue, type)->
    jsonMethod = @get "fetchMethod.#{type}"
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
              contentItem.set "_dataStatus", App.GammaObjectStatus.READY
        return
      complete: (jqXHR, textStatus) =>
        #check for requested but not received rows
        for id in idList
          contentItems = fetchQueue.filter((x) -> id == x.get "id")
          for contentItem in contentItems
            if App.GammaObjectStatus.READY != contentItem.get "_dataStatus"
              contentItem.set "_dataStatus", App.GammaObjectStatus.ERROR
        return

  rightPanelAction: (action, objectList) ->
    simpleList = (objectList) ->
      list = []
#      for object in objectList
#        list.push
#          objectType: object.get "objectType"
#          objectName: object.get "objectName"
      list
    switch action
      when "prg", "urg", "rb", "kb", "kl"
        @showPrintExtractModal action, objectList
      when "changeNotification"
        @showChangeNotificationModal objectList
      when "shareSummary"
        @showShareSummaryModal objectList
      when "customReport"
        @showCustomReportModal simpleList(objectList)
      when "difference"
        @showDifferenceReportModal objectList
      when "terrainCategoryReport"
        @openTerrainCategoryReport simpleList(objectList)
      when "reservation"
        @openReservation simpleList(objectList)
      when "scan"
        @openScan simpleList(objectList)
      when "lot", "building", "local", "change", "document"
        @goToRelatedObject action, simpleList(objectList)

  showPrintExtractModal: (action, objectList) ->
    #TODO: make sure objectList is filled with data!
    #TODO: this should be moved to a function and get better approach!
    if (action == "prg" || action == "urg")
      idList = objectList.mapProperty "jrgID"
      type =  "jrg"
    else if (action == "rb" || action == "kb")
      idList = objectList.mapProperty "jrbID"
      type = "jrb"
    else if (action == "kl")
      idList = objectList.mapProperty "jrlID"
      type = "jrl"
    idList = idList.compact()
    idList = idList.uniq()
    selectedObjects = idList.map (x) ->
      App.EgbilObjectRegisterUnitModel.create().setProperties
        registerUnitID: x
        registerUnitType: type
    Em.run.sync()
    printModal = App.PrintExtractsModalView.modal
      controller: @ #looks like we have to set controller otherwise {{render}} won't work
      content: App.PrintExtractsModel.create().setProperties
        extractType: action
        registerUnits: selectedObjects

  showChangeNotificationModal: (objectList) ->
    printModal = App.PrintChangeNotificationModalView.modal
      controller: @ #looks like we have to set controller otherwise {{render}} won't work
      content: App.PrintChangeNotificationModel.create()

  showShareSummaryModal: (objectList) ->
    Em.assert("Share summary can handle only one object", objectList.length != 0)
    shareSummaryModal = App.ShareSummaryModalView.modal
      controller: @ #looks like we have to set controller otherwise {{render}} won't work
      content: objectList.get("0.shares")
      objectType: objectList.get("0._objectType")

  showCustomReportModal: (simpleList) ->
    printModal = App.PrintCustomReportModalView.modal
      controller: @ #looks like we have to set controller otherwise render won't work
      content: App.PrintCustomReportModel.create()

  showDifferenceReportModal: (objectList) ->
    differenceReportModal = App.DifferenceReportModalView.modal()
#    differenceReportModal.set "objectName", objectList.get "0.objectName"
#    differenceReportModal.set "objectType", objectList.get "0.objectType"

  openTerrainCategoryReport: (simpleList) ->
    @get("target").send "openTerrainCategoryReport", simpleList

  openReservation: (simpleList) ->
    @get("target").send "openReservation", simpleList[0] #reservation is only avialable for single selection

  openScan: (simpleList) ->
    @get("target").send "showScan", simpleList[0]

  goToRelatedObject: (action, simpleList) ->
    $.ajax
      url: "getRelatedObjects.json"
      data:
        relation: action
        objectList: simpleList
      success: (data) =>
        if !Em.isEmpty data && Em.isArray data
          if data.length == 1
            @get("target").send "openObject", Em.Object.create(data[0])
          else
            @get("target").send "openList", data
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling
