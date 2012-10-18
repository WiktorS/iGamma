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

  rightPanelData: Em.Object.create
    jrgib: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KB", type: "kb", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "sharesAccounting", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
#      Em.Object.create { name: "Dzierżawy", type: "leases", multiselect: false }
    ]
    jrb: [
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "sharesAccounting", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    jrl: [
      Em.Object.create { name: "Wypis z RL", type: "rl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "sharesAccounting", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    jrg: [
      Em.Object.create { name: "Wypis z RG", type: "rg", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rozliczenie udziałów", type: "sharesAccounting", multiselect: false }
      Em.Object.create { name: "Lista zmian w JR", type: "changes", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    lots: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "changes", multiselect: true }
      Em.Object.create { name: "Rezerwacja numerów", type: "reservation", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    buildings: [
      Em.Object.create { name: "Wypis z RB", type: "rb", multiselect: true }
      Em.Object.create { name: "Wypis z KL", type: "kl", multiselect: true }
      Em.Object.create { name: "Rezerwacja numerów", type: "reservation", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    locals: [
      Em.Object.create { name: "Wypis z RL", type: "rl", multiselect: true }
    ]
    individuals: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "changes", multiselect: true }
      Em.Object.create { name: "Działki", type: "lots", multiselect: true }
      Em.Object.create { name: "Budynki", type: "buildings", multiselect: true }
      Em.Object.create { name: "Lokale", type: "locals", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    institutions: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "changes", multiselect: true }
      Em.Object.create { name: "Działki", type: "lots", multiselect: true }
      Em.Object.create { name: "Budynki", type: "buildings", multiselect: true }
      Em.Object.create { name: "Lokale", type: "locals", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    groups: [
      Em.Object.create { name: "Wypis pełny z RG", type: "prg", multiselect: true }
      Em.Object.create { name: "Wypis uproszczony z RG", type: "urg", multiselect: true }
      Em.Object.create { name: "Zestawienie klasoużytków", type: "terrainCategorySummary", multiselect: true }
      Em.Object.create { name: "Lista zmian oczekujących", type: "changes", multiselect: true }
      Em.Object.create { name: "Działki", type: "lots", multiselect: true }
      Em.Object.create { name: "Budynki", type: "buildings", multiselect: true }
      Em.Object.create { name: "Lokale", type: "locals", multiselect: true }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]
    documents: [
      Em.Object.create { name: "Skan", type: "scan", multiselect: false }
      Em.Object.create { name: "Działki", type: "lots", multiselect: false }
      Em.Object.create { name: "Budynki", type: "buildings", multiselect: false }
      Em.Object.create { name: "Lokale", type: "locals", multiselect: false }
      Em.Object.create { name: "Zmiany", type: "changes", multiselect: false }
    ]
    changes: [
      Em.Object.create { name: "Dokumenty", type: "docs", multiselect: false }
      Em.Object.create { name: "Działki", type: "lots", multiselect: false }
      Em.Object.create { name: "Zawiadomienie o zmianie", type: "changeNotification", multiselect: false }
      Em.Object.create { name: "Różnice", type: "differences", multiselect: false }
      Em.Object.create { name: "Raport dowolny", type: "customReport", multiselect: true }
    ]

  rightPanelAction: (object, view)->
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
      when "sharesAccounting"
        #modal sharesAccounting
        sharesAccountingModal = App.SharesAccountingView.modal()
        $.ajax
          url: "/getShareAccounting.json"
          data:
            type: objectType
            name: objectName
          success: (data) ->
            if !Em.empty data
              sharesAccountingModal.set "columns", Em.A([ "group", "share" ])
              sharesAccountingModal.set "content", data.map(App.Common.toModel, App.ShareAccountingModel)
            else
              alert "Nie znaleziono rekordu"  #TODO: Error handling
      when "changes"
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
        false
      when "customReport"
        #modal report
        false
      when "lots", "buildings", "locals", "changes"
        #goTo
        false
      when "scan"
        #tab scan
        false
      when "docs"
        #goTo docs
        false
      when "changeNotification"
        #modal print
        false
