App.EgbilController = Em.Controller.extend
  objectList: Em.A()
  rightPanelData:
    jrgib: [
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
    jrg: [
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
    individual: [
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


  getObject: (objectType, objectName) ->
    @get("objectList").filterProperty("objectName", objectName).findProperty("objectType", objectType)

  showObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    @get("target").send "goToObject", object if !Em.empty object

  closeObject: (objectType, objectName) ->
    Em.assert "Cannot close object without type & name", objectType? && objectName?
    object = @getObject objectType, objectName
    if !Em.empty object
      idx = @get("objectList").indexOf object
      @get("objectList").removeObject object
      currentStateObjectName =  App.router.get("currentState.objectName")
      if currentStateObjectName == objectName
        if @get("objectList").length > 0
          idx-- while idx >= @get("objectList").length
          @get("target").send "goToObject", @get("objectList.#{idx}")
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
            content.person = App.Common.toModel.call(App.EgbilObjectPersonModel, data.person)
            content.institution = App.Common.toModel.call(App.EgbilObjectInstitutionModel, data.institution)
            content.group = App.Common.toModel.call(App.EgbilObjectGroupModel, data.group)
            content.landCommunity = App.Common.toModel.call(App.EgbilObjectLandCommunityModel, data.landCommunity)
            content.document = App.Common.toModel.call(App.EgbilObjectDocumentModel, data.document)
            content.registerUnit = App.Common.toModel.call(App.EgbilObjectRegisterUnitModel, data.registerUnit)
            content.lot =  App.Common.toModel.call(App.EgbilObjectLotModel, data.lot)
            content.building =  App.Common.toModel.call(App.EgbilObjectBuildingModel, data.building)
            content.local =  App.Common.toModel.call(App.EgbilObjectLocalModel, data.local)
            content.shares = data.shares.map(App.Common.toModel, App.EgbilObjectShareModel)
            content.lots = data.lots.map(App.Common.toModel, App.EgbilObjectLotModel)
            content.buildings = data.buildings.map(App.Common.toModel, App.EgbilObjectBuildingModel)
            content.rights = data.rights.map(App.Common.toModel, App.EgbilObjectRightModel)
            content.locals = data.locals.map(App.Common.toModel, App.EgbilObjectLocalModel)
            content.landCommunities = data.landCommunities.map(App.Common.toModel, App.EgbilObjectLandCommunityModel)
            content.members = data.members.map(App.Common.toModel, App.EgbilObjectMemberModel)
            content.changes = data.changes.map(App.Common.toModel, App.EgbilObjectChangeModel)
            content.documents = data.documents.map(App.Common.toModel, App.EgbilObjectDocumentModel)
            content.useClasses = data.useClasses.map(App.Common.toModel, App.EgbilObjectUseClassModel)
            content.premises = data.premises.map(App.Common.toModel, App.EgbilObjectPremiseModel)
            object = Em.Object.create content,
              objectType: objectType
              objectName: objectName
              groupName: @getGroupName objectType
            @get("objectList").addObject object
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
      when "document" then "Dokument"
      when "person" then "Osoba fizyczna"
      when "institution" then "Instytucja"
      when "group" then "Podmiot grupowy"
      when "landCommunity" then "Zarząd wspólnoty grupowej"

  rightPanelAction: (action, objectList) ->
    simpleList = (objectList) ->
      list = []
      for object in objectList
        list.push
          objectType: object.get "objectType"
          objectName: object.get "objectName"
      list
    switch action
      when "prg", "urg", "rb", "kb", "kl"
        @showPrintExtractModal action, objectList
      when "changeNotification"
        @showChangeNotificationModal objectList
      when "shareSummary"
        @showShareSummaryModal simpleList(objectList)
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
    printModal = App.PrintModalView.modal()
    if (objectList.length == 1)
      selectedShares = objectList[0].get "selectedShares"
      selectedLots = objectList[0].get "selectedLots"
    else
      selectedShares = Em.A()
      selectedLots = Em.A()
    printModal.set "selectedObjects", objectList
    printModal.set "selectedShares", selectedShares
    printModal.set "selectedLots", selectedLots

  showChangeNotificationModal: (objectList) ->
    printModal = App.PrintModalView.modal()
    if (objectList.length == 1)
      selectedShares = objectList[0].get "selectedShares"
      selectedLots = objectList[0].get "selectedLots"
    else
      selectedShares = Em.A()
      selectedLots = Em.A()
    printModal.set "selectedObjects", objectList
    printModal.set "selectedShares", selectedShares
    printModal.set "selectedLots", selectedLots

  showShareSummaryModal: (simpleList) ->
    shareSummaryModal = App.ShareSummaryModalView.modal()
    $.ajax
      url: "getShareSummary.json"
      data:
        object: simpleList
      success: (data) ->
        if !Em.empty data
          shareSummaryModal.set "columns", Em.A([ "group", "share" ])
          shareSummaryModal.set "content", data.map(App.Common.toModel, App.ShareSummaryModel)
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling

  showCustomReportModal: (simpleList) ->
    customReportModal = App.CustomReportModalView.modal()
    $.ajax
      url: "getCustomReportData.json"
      data:
        object: simpleList
      success: (data) ->
        if !Em.empty data
          customReportModal.set "attributeList", data.attributeList.map(((x) ->
            @create x ? Em.Object.create(),
              isChosen: false
              displayValue: x.name
            ), Em.Object)
          customReportModal.set "configurationList", data.configurationList.map(((x) ->
            @create x ? Em.Object.create()
            ), Em.Object)
          customReportModal.set "unitList", data.unitList
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling

  showDifferenceReportModal: (objectList) ->
    differenceReportModal = App.DifferenceReportModalView.modal()
    differenceReportModal.set "objectName", objectList.get "0.objectName"
    differenceReportModal.set "objectType", objectList.get "0.objectType"

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
        if !Em.empty data && Em.isArray data
          if data.length == 1
            @get("target").send "openObject", Em.Object.create(data[0])
          else
            @get("target").send "openList", data
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling
