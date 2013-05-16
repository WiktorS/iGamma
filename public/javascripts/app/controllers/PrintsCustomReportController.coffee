App.PrintsCustomReportController = Em.Controller.extend
  #input params
  content: null

  # objectTypes: [
  #   Em.Object.create
  #     name: "Jednostki Rejestrowe Gruntów i Budynków"
  #     type: "jrg"
  #   Em.Object.create
  #     name: "Jednostki Rejestrowe Budynków"
  #     type: "jrb"
  #   Em.Object.create
  #     name: "Jednostki Rejestrowe Lokali"
  #     type: "jrl"
  #   Em.Object.create
  #     name: "Działki"
  #     type: "lot"
  #   Em.Object.create
  #     name: "Budynki"
  #     type: "building"
  #   Em.Object.create
  #     name: "Osoby fizyczne"
  #     type: "person"
  #   Em.Object.create
  #     name: "Instytucje"
  #     type: "institution"
  #   Em.Object.create
  #     name: "Podmioty grupowe"
  #     type: "group"
  #   Em.Object.create
  #     name: "Zmiana"
  #     type: "change"
  #   ]
  # selectedObjectType: null
  # objectTypeBinding: "selectedObjectType.type"

  objectList: []
  objectType: "jrg"

  objectColumns: (->
    objectType = @get "objectType"
    objectColumnsOrder = @get "objectColumnsOrder.#{objectType}"
    Em.assert "Column order in #{@get("constructor").toString()} is not defined for type '#{objectType}'", objectColumnsOrder
    App.Columns.getColumns objectColumnsOrder
    ).property("objectType")
  objectColumnsOrder:
    building: [ "check","building" ]
    document: [ "check","document" ]
    group: [ "check","group" ]
    person: [ "check","person" ]
    institution: [ "check","institution" ]
    jrg: [ "check","jrg","jrb" ]
    jrb: [ "check","jrb" ]
    jrl: [ "check","jrl" ]
    oldJrg: [ "check","jrg" ]
    lot: [ "check","lot" ]
    change: [ "check", "change" ]

  # fetchDataCallback: (fetchQueue, type) ->
  #   cache = @get "controllers.gammaCache"
  #   idList = Em.makeArray(fetchQueue).map (x) -> x.get "id"
  #   cache.getPrecincts idList, =>
  #     cachePrecincts = cache.get "precincts"
  #     for precinct in fetchQueue
  #       cached = cachePrecincts.find (x) -> precinct.get("id") == x.get "id"
  #       if cached?
  #         for own key,value of cached
  #           precinct.set key, value
  #         precinct.set "_dataStatus", App.GammaObjectStatus.READY

  attributeList: null
  chosenAttributeListBinding: "content.attributes"
  selectedPossibleAttributeList: null
  selectedChosenAttributeList: null
  configurationList: null
  selectedConfigurationList: null

  #dictionaries
  precisionList: [
      Em.Object.create {value: 1, displayValue: "1"}
      Em.Object.create {value: 2, displayValue: "2"}
      Em.Object.create {value: 3, displayValue: "3"}
      Em.Object.create {value: 4, displayValue: "4"}
      Em.Object.create {value: 5, displayValue: "5"}
      Em.Object.create {value: 6, displayValue: "6"}
      Em.Object.create {value: 7, displayValue: "7"}
      Em.Object.create {value: 8, displayValue: "8"}
      Em.Object.create {value: 9, displayValue: "9"}
      ]
  unitList: [
      Em.Object.create {value: 0, displayValue: "m2"}
      Em.Object.create {value: 1, displayValue: "a"}
      Em.Object.create {value: 2, displayValue: "ha"}
      Em.Object.create {value: 3, displayValue: "km2"}
      ]
  lineBreakList: [
      Em.Object.create {value: 0, displayValue: "brak"}
      Em.Object.create {value: 1, displayValue: "co 1 obiekt"}
      Em.Object.create {value: 5, displayValue: "co 5 obiektów"}
      Em.Object.create {value: 10, displayValue: "co 10 obiektów"}
      ]
  fileFormatList: [
      Em.Object.create {value: "html", displayValue: "HTML"}
      Em.Object.create {value: "csv", displayValue: "CSV"}
      ]

  possibleAttributeList: (->
    if (chosenList = @get("chosenAttributeList"))
      @get("attributeList").reject (x) ->
        chosenList.someProperty "name", x.name
    else
      @get("attributeList")
    ).property("attributeList.@each", "chosenAttributeList.@each")

  anyPossibleAttributeSelected: (->
    @get("selectedPossibleAttributeList").length > 0
    ).property("selectedPossibleAttributeList.length")

  anyChosenAttributeSelected: (->
    @get("selectedChosenAttributeList").length > 0
    ).property("selectedChosenAttributeList.length")

  selectedChosenAttribute: (->
    #only if one is selected
    if @get("selectedChosenAttributeList").length == 1
      @get("selectedChosenAttributeList")[0]
    ).property("selectedChosenAttributeList.@each")

  disableAttributeEdit: (->
    Em.isEmpty @get("selectedChosenAttribute")
    ).property("selectedChosenAttribute")

  disableMoveUpSelectedChosenAttribute: (->
    if @get("selectedChosenAttributeList").length == 1
      idx = @get("chosenAttributeList").indexOf @get("selectedChosenAttributeList")[0]
      idx == 0
    else
      true
    ).property("selectedChosenAttributeList.@each.sort", "chosenAttributeList.length")

  disableMoveDownSelectedChosenAttribute: (->
    if @get("selectedChosenAttributeList").length == 1
      idx = @get("chosenAttributeList").indexOf @get("selectedChosenAttributeList")[0]
      idx == @get("chosenAttributeList").length - 1
    else
      true
    ).property("selectedChosenAttributeList.@each.sort", "chosenAttributeList.length")

  anyConfigurationSelected: (->
    @get("selectedConfigurationList").length > 0
    ).property("selectedConfigurationList.length")

  disablePrint: (->
    @get("chosenAttributeList").length == 0
    ).property("chosenAttributeList.length")

  init: ->
    @_super()
    @set "attributeList", Em.A()
    @set "selectedPossibleAttributeList", Em.A()
    @set "selectedChosenAttributeList", Em.A()
    @set "configurationList", Em.A()
    @set "selectedConfigurationList", Em.A()
    @getCustomReportData()

  getCustomReportData: ->
    #TODO: Cache this data
    App.Common.ajax
      url: "api/getCustomReportData.json"
      data:
        objectType: @get "objectType"
      success: (data) =>
        if !Em.isEmpty data
          @set "attributeList", data.attributes.map(App.Common.toModel, App.PrintCustomReportAttributeModel)
          @set "configurationList", data.configurations.map(App.Common.toModel, App.PrintCustomReportConfigurationModel)
          @set "content.attributeLegend", data.attributeLegend
          @set "content.lineBreak", data.lineBreak
          @set "content.fileFormat", data.fileFormat
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling

  onAddAttribute: ->
    for item in @get("selectedPossibleAttributeList")
      obj = Em.Object.create()
      obj.set key, item.get key for own key of item
      @get("chosenAttributeList").addObject obj
    #need to set to empty array to refresh buttons state
    @set "selectedPossibleAttributeList", Em.A()

  onDelAttribute: ->
    for item in @get("selectedChosenAttributeList")
      @get("chosenAttributeList").removeObject item
    #need to set to empty array to refresh buttons state
    @set "selectedChosenAttributeList", Em.A()

  onUpAttribute: ->
    if !@get "disableMoveUpSelectedChosenAttribute"
      current = @get("selectedChosenAttribute")
      idx = @get("chosenAttributeList").indexOf current
      if idx > 0
        prev = @get("chosenAttributeList")[idx-1]
        @get("chosenAttributeList").removeObject prev
        @get("chosenAttributeList").insertAt idx, prev

  onDownAttribute: ->
    if !@get "disableMoveDownSelectedChosenAttribute"
      current = @get("selectedChosenAttribute")
      idx = @get("chosenAttributeList").indexOf current
      if idx < @get("chosenAttributeList").length-1
        next = @get("chosenAttributeList")[idx+1]
        @get("chosenAttributeList").removeObject next
        @get("chosenAttributeList").insertAt idx, next

  onLoadConfig: ->
    list = @get "selectedConfigurationList"
    if 1 == list.get "length"
      config = list[0]
      @set "chosenAttributeList", []
      for attribute in config.get("attributes")
        item = @get("attributeList").find (x) -> x.get("name") == attribute.name
        Em.warn "Attribute '#{attribute.name}' not found in possible attributes list", item
        if item
          obj = Em.Object.create()
          #set new object values, first from default then override with config
          obj.set key, item.get key for own key of item
          obj.set key, attribute[key] for own key of attribute
          @get("chosenAttributeList").addObject obj
      @set "content.fileFormat", config.get "fileFormat"
      @set "content.lineBreak", config.get "lineBreak"
      @set "content.attributeLegend", config.get "attributeLegend"
    else
      alert "Wczytać można tylko jedną zaznaczoną configurację" #TODO

  onSaveConfig: ->
    name = "TODO" #TODO: Input popup?
    attributes = @get("content.attributes").map (x)->
      x.getProperties "name","label","precision","unit","sumUp","dictionaryLegend"
    config = {
      name: name
      attributes: attributes
      attributeLegend: @get "content.attributeLegend"
      lineBreak: @get "content.lineBreak"
      fileFormat: @get "content.fileFormat"
    }
    App.Common.ajax
      url: "api/saveCustomReportConfig.json"
      data:
        config: config
      success: (data) =>
        @set "selectedConfigurationList", []
        @set "attributeList", data.attributes.map(App.Common.toModel, App.PrintCustomReportAttributeModel)
        @set "configurationList", data.configurations.map(App.Common.toModel, App.PrintCustomReportConfigurationModel)

  onRemoveConfig: ->
    list = @get "selectedConfigurationList"
    removeList = list.map (x) -> x.get "name"
    App.Common.ajax
      url: "api/removeCustomReportConfig.json"
      data:
        configList: removeList
      success: (data) =>
        @set "selectedConfigurationList", []
        @set "attributeList", data.attributes.map(App.Common.toModel, App.PrintCustomReportAttributeModel)
        @set "configurationList", data.configurations.map(App.Common.toModel, App.PrintCustomReportConfigurationModel)
