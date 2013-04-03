App.ModelTableCellView = Em.View.extend
  tagName: "td"
  defaultTemplate: Em.Handlebars.compile "{{view.displayValue}}"

  content: null
  column: null

  #since we can't provide binding to known property name we have to register dynamic binding
  displayValue: (-> @get "dynamicDisplayValue").property("dynamicDisplayValue")
  dynamicDisplayValue: null
  dynamicDisplayValueBind: null

  _contentDidChange: (-> @refreshDynamicBind()).observes("content", "column.name")

  init: ->
    @_super()
    @refreshDynamicBind()

  destroy: ->
    @_super()
    bind.disconnect @ if (bind = @get "dynamicDisplayValueBind")

  refreshDynamicBind: ->
    bind.disconnect @ if (bind = @get "dynamicDisplayValueBind")
    bind = Em.Binding.from("content.#{@get "column.name"}").to("dynamicDisplayValue")
    bind.connect @
    @set "dynamicDisplayValueBind", bind
