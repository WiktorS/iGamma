App.ModelTableCellView = Em.View.extend
  tagName: "td"
  displayValue: (-> @get "value").property("value")
  value: null
  type: null
  defaultTemplate: Em.Handlebars.compile "{{view.displayValue}}"
