App.EgbilListView = Em.View.extend
  templateName: "egbilList"
  layout: null
  didInsertElement: ->
    @set "layout", @$().layout
      defaults:
        resizable: false
        slidable: false
        closable: true
      east:
        initClosed: !(@get("controller.isAnyChecked") && @get("controller.canShowRightPanel"))
    layout = @get "layout"
    #disable closable here (force hide) - don't do it in options above, because we do need "toggle" later
    if layout.east.state.isClosed && layout.east.options.closable
      layout.disableClosable("east", true)
  _checkedItemsCountChanged: (->
    layout = @get("layout")
    if layout?
      if @get("controller.isAnyChecked")  && @get("controller.canShowRightPanel")
        if !layout.east.options.closable
          layout.enableClosable("east")
          layout.open "east"
      else
        layout.close "east"
        if layout.east.options.closable
          layout.disableClosable("east", true)
    ).observes("controller.isAnyChecked", "controller.canShowRightPanel")


App.EgbilListTableCellCheckBoxView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view Ember.Checkbox checkedBinding=\"view.content.check\"}}"


App.EgbilListTableCellShowMapView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellShow"
  didInsertElement: ->
    this.$("a").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300
  map: -> App.router.transitionTo "egbil.map"


App.EgbilListTableCellMarkerView = App.ModelTableCellView.extend
  tooltip: null
  template: Em.Handlebars.compile "<span title=\"{{tooltip}}\">{{view.displayValue}}</span>"
  didInsertElement: ->
    this.$("span").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300


App.EgbilListTableCellButtonView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellButton"
  displayValue: (->
    if valueName = @get "column.data.valueName"
      @get "content.#{valueName}"
    else
      @get "content.#{@get "column.data.valueType"}Name"
    ).property("content", "column.data.valueName", "column.data.valueType")
  value: (->
    if value = @get "column.data.value"
      @get "content.#{value}"
    else
      @get "content.#{@get "column.data.valueType"}ID"
    ).property("content", "column.data.value", "column.data.valueType")
  valueType: (->    
    @get("content.#{@get "column.data.valueType"}Type") ? @get "column.data.valueType"
    ).property("content", "column.data.valueType")
  openObject: ->
    object = App.EgbilObjectModel.create().setProperties
      _objectId: @get "value"
      _objectType: @get "valueType"
      _objectName: @get "displayValue"
    Em.run.sync() #_objectId and id need sync a this moment! #console.log "Sync test #{object.get "id"}=#{object.get "_objectId"}"
    @get("controller.target").send "openObject", object


App.EgbilListTableCellListView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellList"
  valueList: (-> @get "content.#{@get "column.data.value"}").property("content", "column.data.value")
  valueListName: (-> 
    list = @get "valueList"
    name = @get("column.data.valueName") ? "_objectName"
    x.get name for x in (list ? [])
    ).property("valueList", "column.data.valueName")

  isIdle: (->
    @get("valueList")?.everyProperty "_dataStatus", App.EgbilObjectStatus.IDLE
    ).property("valueList.@each._dataStatus")

  isLoading: (->
    @get("valueList")?.everyProperty "_dataStatus", App.EgbilObjectStatus.LOADING
    ).property("valueList.@each._dataStatus")

  isReady: (->
    @get("valueList")?.everyProperty "_dataStatus", App.EgbilObjectStatus.READY
    ).property("valueList.@each._dataStatus")

  isError: (->
    !@get("isIdle") && !@get("isLoading") && !@get("isReady")
    ).property("isIdle", "isLoading", "isReady")

  didInsertElement: ->
    if !@get("isReady")
      tableView = @get "parentView.parentView"
      if tableView instanceof App.ModelTableView
        tableView.fetchQueueAppend value for value in (@get("valueList") ? Em.A())

  retryFetch: ->
    if @get("isError")
      tableView = @get "parentView.parentView"
      if tableView instanceof App.ModelTableView
        #use fetchQueue mechanism, but maybe its better to call directly - its unlike to fetch several records this way
        tableView.fetchQueueAppend value for value in (@get("valueList") ? Em.A())


App.EgbilListTableCellEntityView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "TODO"


App.EgbilListTableCellSubTableView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellSubTable"
  valueList: (-> @get "content.#{@get "column.data.value"}").property()
  valueColumnsBinding: "column.data.columns"
  valueType: (->    
    @get("content.#{@get "column.data.valueType"}Type") ? @get "column.data.valueType"
    ).property("content", "column.data.valueType")


App.EgbilListTableCellGroupKindView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "TODO"


App.EgbilListTableCellValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view.displayValue}}"
  displayValue: (->
    if valueName = @get "column.data.valueName"
      @get "content.#{valueName}"
    else
      @get "content.#{@get "column.data.valueType"}Name"
    ).property("content", "column.data.valueName", "column.data.valueType")


App.EgbilListTableCellIsValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{#if view.isNotEmptyValue}}V{{/if}}"
  isNotEmptyValue: (-> !Ember.empty(@get "column.data.value")).property("column.data.value")
