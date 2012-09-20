App.ModelValueTableRowView = Em.View.extend
  tagName: "tr"

  template: (->
    column = @get "column"
    content = @get "content"
    result = ""
    if content?
        cell = content.get column
        Ember.assert "Cell must inherit from App.StandardTableCellModel",cell instanceof App.StandardTableCellModel

        result += "<td class=\"header\">#{cell.label}</td>"
        cellClass = cell.get("viewClass") ? "App.ModelTableCellView"
        result += "{{view #{cellClass} contentBinding=\"view.content.#{column}\"}}"
    Em.Handlebars.compile result
  ).property("columns.@each", "content.@each")
