App.ModelTableCellView = Em.View.extend
  tagName: "td"
  value: null
  type: null
  defaultTemplate: Em.Handlebars.compile "{{view.value}}"
