App.ModelTableRowView = Em.View.extend
  tagName: "tr"

  template: (->
    columns = @get "columns"
    content = @get "content"
    result = ""
    if content?
      $.each(columns, (i, field) ->
        cell = content.get field
        if cell instanceof App.StandardTableCellModel
          cellClass = cell.get("viewClass") ? "App.ModelTableCellView"
          cellDisplayValue = cell.get("displayValue")
          cellValue = cell.get("value") ? ""
          cellValueType = cell.get("valueType")
          tagParams = ""
          tagParams += " displayValue=\"#{cellDisplayValue}\"" if cellDisplayValue?
          tagParams += " value=\"#{cellValue}\"" if cellValue?
          tagParams += " type=\"#{cellValueType}\"" if cellValueType?
          tagParams += " param=\"#{cellValueType}\"" if cellValueType?
          result += "{{view #{cellClass} #{tagParams}}}";
      )
    Em.Handlebars.compile result
  ).property("columns.@each", "content.@each")
