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
  valueListButton: (-> 
    list = @get("valueList") ? []
    valueName = @get("column.data.valueName") ? "_objectName"
    valueType = @get("column.data.valueType")
    value = "#{@get "column.data.valueType"}ID" if valueType
    output = list.map (x)->
      Em.Object.create
        content: App.EgbilObjectModel.create().setProperties
          _objectType: valueType
          _objectNameBinding: "valueName" 
          id: x.get(value) if value
          valueName: x.get valueName
        column: Em.Object.create
          data: Em.Object.create
            value: "id"
            valueType: valueType
            valueName: "valueName"
    Em.run.sync()
    output
    ).property("valueList", "column.data.valueName")
  isValueTypeDefined: (-> 
    !Em.empty @get("column.data.valueType")
    ).property("column.data.valueType")
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


App.EgbilListTableCellMemberView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view.memberValue}}"
  member: (->
    memberType = @get "content.#{@get "column.data.value"}Type"
    @get "content.#{memberType}"
    ).property("content", "column.data.value", "member._dataStatus") 
  #Referencing itself in dependencies looks strange but it works 
  #Using member._dataStatus cuz we need to know when the data is available and it will change when the data are ready 
  memberValue: (->
    @get "member.#{@get "column.data.memberValue"}"
    ).property("member", "column.data.memberValue")

  isIdle: (->
    App.EgbilObjectStatus.IDLE == @get "member._dataStatus"
    ).property("member._dataStatus")

  isLoading: (->
    App.EgbilObjectStatus.LOADING == @get "member._dataStatus"
    ).property("member._dataStatus")

  isReady: (->
    App.EgbilObjectStatus.READY == @get "member._dataStatus"
    ).property("member._dataStatus")

  isError: (->
    !@get("isIdle") && !@get("isLoading") && !@get("isReady")
    ).property("isIdle", "isLoading", "isReady")

  didInsertElement: ->
    if !@get("isReady")
      tableView = @get "parentView.parentView"
      if tableView instanceof App.ModelTableView
        value = @get "member"
        value.set "id", @get("content.id")
        Em.run.sync()
        tableView.fetchQueueAppend value

  retryFetch: ->
    if @get("isError")
      tableView = @get "parentView.parentView"
      if tableView instanceof App.ModelTableView
        #use fetchQueue mechanism, but maybe its better to call directly - its unlike to fetch several records this way
        value = @get "member"
        value.set "id", @get("content.id")
        Em.run.sync()
        tableView.fetchQueueAppend value


App.EgbilListTableCellSubTableView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellSubTable"
  valueList: (-> @get "content.#{@get "column.data.value"}").property()
  valueColumnsBinding: "column.data.columns"
  valueType: (->    
    @get("content.#{@get "column.data.valueType"}Type") ? @get "column.data.valueType"
    ).property("content", "column.data.valueType")


App.EgbilListTableCellGroupKindView = App.ModelTableCellView.extend
  template: (->
    result  = "{{#if view.isGroup}}G{{/if}}"
    result += "{{#if view.isMarriage}}M{{/if}}"
    Em.Handlebars.compile result
    ).property()
  value: (-> 
      @get "content.#{@get "column.data.value"}Type"
    ).property("content.entityType", "column.data.value")
  isGroup: (-> @get("isFirstInSet") && "group" == @get "value").property("value")
  isMarriage: (-> @get("isFirstInSet") && "marriage" == @get "value").property("value")
  isFirstInSet: (-> true).property() #TODO: how to know it?


App.EgbilListTableCellPersonKindView = App.ModelTableCellView.extend
  template: (->
    result  = "{{#if view.isGroup}}G{{/if}}"
    result += "{{#if view.isPerson}}F{{/if}}"
    result += "{{#if view.isMarriage}}M{{/if}}"
    result += "{{#if view.isInstitution}}I{{/if}}"
    Em.Handlebars.compile result
    ).property()
  value: (-> 
    id = @get "content.id"
    type = @get "column.data.valueType"
    if type == "member"
      @get "content._objectType"
    else
      shares = Em.A(@get "controller.content.#{type}sShare")
      share = shares.find((x) -> x.get("id") == id)
      if share
        share.get "entityType"
    ).property("content", "column.data.value")
  isGroup: (-> "group" == @get "value").property("value")
  isPerson: (-> "person" == @get "value").property("value")
  isMarriage: (-> "marriage" == @get "value").property("value")
  isInstitution: (-> "institution" == @get "value").property("value")


App.EgbilListTableCellValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view.displayValue}}"
  displayValue: (->
    if valueName = @get "column.data.valueName"
      @get "content.#{valueName}"
    else
      @get "content.#{@get "column.data.valueType"}Name"
    ).property("content", "column.data.valueName", "column.data.valueType")


App.EgbilListTableCellIsValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{#unless view.isEmptyValue}}<i class=\"icon-white icon-ok\"></i>{{/unless}}"
  isEmptyValue: (-> Ember.empty(@get "column.data.value")).property("column.data.value")
