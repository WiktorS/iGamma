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
          cellClass = cell?.viewClass ? "App.ModelTableCellView"
          cellValue = cell?.value ? ""
          cellValueType = cell?.valueType ? ""
          result += "{{view %@ value=\"%@\" type=\"%@\"}}".fmt(cellClass, cellValue, cellValueType);
      )
    Em.Handlebars.compile result
  ).property()
