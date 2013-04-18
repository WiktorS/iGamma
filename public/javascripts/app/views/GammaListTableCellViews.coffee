App.GammaListTableCellCheckBoxView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view Ember.Checkbox checkedBinding=\"view.content.check\"}}"


App.GammaListTableCellShowMapView = App.ModelTableCellView.extend
  templateName: "gammaListTableCellShow"
  didInsertElement: ->
    this.$("a").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300
  map: -> App.router.transitionTo "egbil.map"


App.GammaListTableCellMarkerView = App.ModelTableCellView.extend
  tooltip: null
  template: Em.Handlebars.compile "<span title=\"{{tooltip}}\">{{view.displayValue}}</span>"
  didInsertElement: ->
    this.$("span").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300


App.GammaListTableCellButtonView = App.ModelTableCellView.extend
  templateName: "gammaListTableCellButton"
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
    object = App.GammaObjectModel.create().setProperties
      _objectId: @get "value"
      _objectType: @get "valueType"
      _objectName: @get "displayValue"
    Em.run.sync() #_objectId and id need sync a this moment! #console.log "Sync test #{object.get "id"}=#{object.get "_objectId"}"
    @get("controller.target").send "openObject", object


App.GammaListTableCellListView = App.ModelTableCellView.extend
  templateName: "gammaListTableCellList"
  valueList: (-> @get "content.#{@get "column.data.value"}").property("content", "column.data.value")
  valueListButton: (->
    list = @get("valueList") ? []
    valueName = @get("column.data.valueName") ? "_objectName"
    valueType = @get("column.data.valueType")
    value = "#{@get "column.data.valueType"}ID" if valueType
    output = list.map (x)->
      Em.Object.create
        content: App.GammaObjectModel.create().setProperties
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
    !Em.isEmpty @get("column.data.valueType")
    ).property("column.data.valueType")
  isIdle: (->
    @get("valueList")?.everyProperty "_dataStatus", App.GammaObjectStatus.IDLE
    ).property("valueList.@each._dataStatus")
  isLoading: (->
    @get("valueList")?.everyProperty "_dataStatus", App.GammaObjectStatus.LOADING
    ).property("valueList.@each._dataStatus")
  isReady: (->
    @get("valueList")?.everyProperty "_dataStatus", App.GammaObjectStatus.READY
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


App.GammaListTableCellMemberView = App.ModelTableCellView.extend
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
    App.GammaObjectStatus.IDLE == @get "member._dataStatus"
    ).property("member._dataStatus")

  isLoading: (->
    App.GammaObjectStatus.LOADING == @get "member._dataStatus"
    ).property("member._dataStatus")

  isReady: (->
    App.GammaObjectStatus.READY == @get "member._dataStatus"
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


App.GammaListTableCellSubTableView = App.ModelTableCellView.extend
  templateName: "gammaListTableCellSubTable"
  valueList: (-> @get "content.#{@get "column.data.value"}").property()
  valueColumnsBinding: "column.data.columns"
  valueType: (->
    @get("content.#{@get "column.data.valueType"}Type") ? @get "column.data.valueType"
    ).property("content", "column.data.valueType")


App.GammaListTableCellGroupKindView = App.ModelTableCellView.extend
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


App.GammaListTableCellPersonKindView = App.ModelTableCellView.extend
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


#TODO: remove after cleaning up address in model
App.GammaListTableCellValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view.displayValue}}"
  displayValue: (->
    if valueName = @get "column.data.valueName"
      @get "content.#{valueName}"
    else
      @get "content.#{@get "column.data.valueType"}Name"
    ).property("content", "column.data.valueName", "column.data.valueType")


App.GammaListTableCellIsValueView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{#unless view.isEmptyValue}}<i class=\"icon-white icon-ok\"></i>{{/unless}}"
  isEmptyValue: (-> Ember.isEmpty(@get "column.data.value")).property("column.data.value")


App.GammaListTableCellJRChangeView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view.displayValue}}"
  displayValue: (->
    value = @get "column.data.value"
    valueName = @get "column.data.valueName"
    list = @get "controller.content.#{value}"
    valueItem = list?.findProperty("id", @get "content.id")
    valueItem?.get valueName
    ).property("controller.content", "content.id", "column.data.valueName", "column.data.value")


App.GammaListTableCellEditButtonView = App.ModelTableCellView.extend
  templateName: "gammaListTableCellEditButton"

  disabledBinding: "content.disabled"
  inEditBinding: "content.inEdit"

  edit: ->
    @set "inEdit", true
    controller = @get "controller"
    controller.edit @get("content") if "function" == typeof controller.edit

  reset: ->
    controller = @get "controller"
    controller.reset @get("content") if "function" == typeof controller.reset

  cancel: ->
    @set "inEdit", false
    controller = @get "controller"
    controller.cancel @get("content") if "function" == typeof controller.cancel

  save: ->
    @set "inEdit", false
    controller = @get "controller"
    controller.save @get("content") if "function" == typeof controller.save
