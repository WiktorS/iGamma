App.ModelTableCellView = Em.View.extend
  tagName: "td"
  displayValue: (->
    content = @get "content"
    content.get(@get "column.name")
    ).property("content", "column.name")
  defaultTemplate: Em.Handlebars.compile "{{view.displayValue}}"

  content: null
  column: null
