App.ModelTableCellView = Em.View.extend
  tagName: "td"
  displayValue: (-> @get "content.displayValue").property("content.displayValue")
  defaultTemplate: Em.Handlebars.compile "{{view.displayValue}}"
