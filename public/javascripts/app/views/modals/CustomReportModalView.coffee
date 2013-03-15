App.CustomReportModalView = App.ModalView.extend
  templateName: "customReportModal"

  attributeList: null
  selectedPossibleAttributeList: null
  selectedChosenAttributeList: null
  configurationList: null
  selectedConfigurationList: null

  attributeLegend: false
  lineBreak: null
  lineBreakList: null
  fileFormat: null
  fileFormatList: null

  _attributeListChanged: (->
    @fillAttributeListSort()
    ).observes("attributeList")

  possibleAttributeList: (->
    list = @get("attributeList").filterProperty "isChosen", false
    list.sort (x,y) -> x.get("sort") - y.get("sort")
    list
    ).property("attributeList.@each.isChosen", "attributeList.@each.sort")

  chosenAttributeList: (->
    list = @get("attributeList").filterProperty "isChosen", true
    list.sort (x,y) -> x.get("sort") - y.get("sort")
    list
    ).property("attributeList.@each.isChosen", "attributeList.@each.sort")

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
    @set "precisionList", [ "1", "2", "3", "4", "5", "6", "7", "8" ]
    @set "unitList", Em.A() #[ "m2", "a", "ha", "km2" ]
    @set "lineBreakList", [
      Em.Object.create {value: 0, displayValue: "brak"}
      Em.Object.create {value: 1, displayValue: "co 1 obiekt"}
      Em.Object.create {value: 5, displayValue: "co 5 obiektów"}
      Em.Object.create {value: 10, displayValue: "co 10 obiektów"}
      ]
    @set "fileFormatList", [
      Em.Object.create {value: "html", displayValue: "HTML"}
      Em.Object.create {value: "cvs", displayValue: "CSV"}
      ]

  onAddAttribute: ->
    $.each(@get("selectedPossibleAttributeList"), (key, value) ->
      value.set "isChosen", true
    )
    #need to set to empty array to refresh buttons status
    @set "selectedPossibleAttributeList", Em.A()

  onDelAttribute: ->
    $.each(@get("selectedChosenAttributeList"), (key, value) ->
      value.set "isChosen", false
    )
    #need to set to empty array to refresh buttons status
    @set "selectedChosenAttributeList", Em.A()

  onUpAttribute: ->
    if !@get "disableMoveUpSelectedChosenAttribute"
      current = @get("selectedChosenAttribute")
      idx = @get("chosenAttributeList").indexOf current
      if idx > 0
        prev = @get("chosenAttributeList")[idx-1]
        @swapSortOnAttributeList current, prev

  onDownAttribute: ->
    if !@get "disableMoveDownSelectedChosenAttribute"
      current = @get("selectedChosenAttribute")
      idx = @get("chosenAttributeList").indexOf current
      if idx < @get("chosenAttributeList").length-1
        next = @get("chosenAttributeList")[idx+1]
        @swapSortOnAttributeList current, next

  onSaveConfiguration: ->
    list = @get "chosenAttributeList"
    #TODO: Save configuration

  onDelConfiguration: ->
    list = Em.A()
    $.each(@get("selectedConfigurationList"), (key,value) ->
      list.addObject value.get("name")
      )
    #TODO: Delete configuration

  onPrint: ->
    if !@get "disablePrint"
      configuration = {
        attributeLegend: @get "attributeLegend"
        lineBreak: @get "lineBreak.displayValue"
        fileFormat: @get "fileFormat.displayValue"
        attributeList: @get("chosenAttributeList").map((x)->
          {
            name: x.get "name"
            displayValue: x.get "displayValue"
            type: x.get "type"
            precision: x.get "precision"
            unit: x.get "unit"
            sumUp: x.get "sumUp"
            dictionaryLegend: x.get "dictionaryLegend"
          }
        )
      }
      App.router.send "openCustomReport", configuration
      @hideModal()

  fillAttributeListSort: ->
    $.each(@get("attributeList"), (key, value) ->
      value.set "sort", key
      )

  swapSortOnAttributeList: (item1, item2) ->
    item1Idx = @get("attributeList").indexOf item1
    item2Idx = @get("attributeList").indexOf item2
    sort = @get("attributeList")[item1Idx].get "sort"
    @get("attributeList")[item1Idx].set "sort", @get("attributeList")[item2Idx].get "sort"
    @get("attributeList")[item2Idx].set "sort", sort
