App.ModelTableHeaderView = Em.View.extend
  template: Em.Handlebars.compile("{{view.column.data.label}}")
  tagName: "th"
  column: null
