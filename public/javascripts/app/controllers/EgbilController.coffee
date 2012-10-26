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
      when "document" then "Dokument"

  rightPanelData: Em.Object.create
    jrgib: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KB", type: "kb", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
#      Em.Object.create { name: "Dzierżawy", type: "leases", multiselect: false }
    ]
    jrb: [
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    jrl: [
      Em.Object.create { name: "Wypis z RL", type: "rl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    jrg: [
      Em.Object.create { name: "Wypis z RG", type: "rg", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "shareSummary", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    lot: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "changes", multiselect: true }
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
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Działki", type: "lot", multiselect: true }
      Em.Object.create { name: "Budynki", type: "building", multiselect: true }
      Em.Object.create { name: "Lokale", type: "local", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    institution: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "change", multiselect: true }
      Em.Object.create { name: "Działki", type: "lot", multiselect: true }
      Em.Object.create { name: "Budynki", type: "building", multiselect: true }
      Em.Object.create { name: "Lokale", type: "local", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    group: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
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

  rightPanelAction: (object, view) ->
    objectType = view.get("controller.content.objectType")
    objectName = view.get("controller.content.objectName")
    content = view.get("controller.content") 
    switch object.get "type"
      when "prg", "urg", "rb", "kb", "kl"
        #modal print (part of print tab)
        printModal = App.PrintModalView.modal()
        printModal.set "selectedObject", content.get("registerUnit")
        printModal.set "selectedShares", Em.A()
        printModal.set "selectedLots", Em.A()
      when "terrainCategorySummary"
        #tab terrainCategorySummary
        context = Em.Object.create
          objectType: objectType
          objectName: objectName
        @get("target").send "openTerrainCategorySummary", context
      when "shareSummary"
        #modal sharesAccounting
        shareSummaryModal = App.ShareSummaryModalView.modal()
        $.ajax
          url: "/getShareSummary.json"
          data:
            type: objectType
            name: objectName
          success: (data) ->
            if !Em.empty data
              shareSummaryModal.set "columns", Em.A([ "group", "share" ])
              shareSummaryModal.set "content", data.map(App.Common.toModel, App.ShareSummaryModel)
            else
              alert "Nie znaleziono rekordu"  #TODO: Error handling
      when "change"
        #goTo changesList/change(if 1)
        if Em.isArray content
          type = view.get "controller.type"
          checkedList = content.filterProperty "isChecked"
          field = null
          $.each checkedList[0], (k,v) ->
            if v instanceof App.StandardTableCellModel
              if v.get("valueType") == type
                field = k
                return false
          Em.assert "Can't find column with specified object type: #{type}", !Em.empty field
          data = checkedList.map(((x) ->
            @create
              objectName: x.get "#{field}.value"
              objectType: type
            ), Em.Object)
        else
          data = Em.makeArray Em.Object.create
            objectType: objectType
            objectName: objectName
        @get("target").send "showChanges", data
      when "reservation"
        #report?
        if Em.isArray content
          type = view.get "controller.type"
          checkedList = content.filterProperty "isChecked"
          field = null
          $.each checkedList[0], (k,v) ->
            if v instanceof App.StandardTableCellModel
              if v.get("valueType") == type
                field = k
                return false
          Em.assert "Can't find column with specified object type: #{type}", !Em.empty field
          data = checkedList.map(((x) ->
            @create
              objectName: x.get "#{field}.value"
              objectType: type
            ), Em.Object)
        else
          data = Em.makeArray Em.Object.create
            objectType: objectType
            objectName: objectName
        @get("target").send "openReservation", data[0] #only single object possible
      when "customReport"
        #modal report
        customReportModal = App.CustomReportModalView.modal()
        $.ajax
          url: "/getCustomReportData.json"
          data:
            type: objectType
            name: objectName
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
      when "difference"
        #modal DifferenceReport
        differenceReportModal = App.DifferenceReportModalView.modal()
        if Em.isArray content
          type = view.get "controller.type"
          checkedList = content.filterProperty "isChecked"
          field = null
          for own key of checkedList[0]
            value = checkedList[0].get key
            if value instanceof App.StandardTableCellModel
              if value.get("valueType") == type
                field = key
                break
          Em.assert "Can't find column with specified object type: #{type}", !Em.empty field
          data = checkedList.map(((x) ->
            @create
              objectName: x.get "#{field}.value"
              objectType: type
            ), Em.Object)
        else
          data = Em.makeArray Em.Object.create
            objectType: objectType
            objectName: objectName
        differenceReportModal.set "objectName", data.get "0.objectName"
        differenceReportModal.set "objectType", data.get "0.objectType"
      when "lot", "building", "local", "change"
        #goTo
        false
      when "scan"
        #tab scan
        false
      when "document"
        #goTo docs
        false
      when "changeNotification"
        #modal print
        printModal = App.PrintModalView.modal()
        printModal.set "selectedObject", content.get("registerUnit")
        printModal.set "selectedShares", Em.A()
        printModal.set "selectedLots", Em.A()
