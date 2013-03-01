App.ModelValueTableRowView = Em.View.extend
  tagName: "tr"

  template: (->
    column = @get "column"
    content = @get "content"
    result = ""
    if content?
        cell = content.get(column.get "name")
#        Ember.assert "Cell must inherit from App.StandardTableCellModel",cell instanceof App.StandardTableCellModel

        result += "<td class=\"header\">#{column.get "data.label"}</td>"
        cellClass = (column.get("data.viewClass") ? "App.ModelTableCellView").toString()
        result += "{{view #{cellClass} contentBinding=\"view.content\" columnBinding=\"view.column\"}}"
    Em.Handlebars.compile result
  ).property("column", "content")
