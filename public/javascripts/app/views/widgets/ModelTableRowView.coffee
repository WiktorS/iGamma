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
          cellDisplayValue = cell.get("displayValue") ? ""
          cellValueType = cell.get("valueType")
          tagParams = ""
          tagParams += " type=\"#{cellValueType}\"" if cellValueType?
          result += "{{view #{cellClass} value=\"#{cellDisplayValue}\"#{tagParams}}}";
      )
    Em.Handlebars.compile result
  ).property()
