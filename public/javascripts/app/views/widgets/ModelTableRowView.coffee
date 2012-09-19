App.ModelTableRowView = Em.View.extend
  tagName: "tr"

  template: (->
    columns = @get "columns"
    content = @get "content"
    result = ""
    if content?
      $.each(columns, (i, field) ->
        cell = content.get field
        Ember.assert "Cell must inherit from App.StandardTableCellModel",cell instanceof App.StandardTableCellModel

        cellClass = cell.get("viewClass") ? "App.ModelTableCellView"
        result += "{{view #{cellClass} contentBinding=\"view.content.#{field}\"}}"
      )
    Em.Handlebars.compile result
  ).property("columns.@each", "content.@each")
