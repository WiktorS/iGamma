App.EgbilListTableRowView = Em.View.extend
  tagName: "tr"

  template: (->
    columns = @get "columns"
    content = @get "content"
    result = ""
    $.each(columns, (k,v) ->
      item = content?.get(v)
      viewClass = item?.viewClass ? "App.EgbilListTableCellView"
      viewValue = item?.value ? ""
      result += "{{view %@ value=\"%@\"}}".fmt(viewClass, viewValue);
    )
    Em.Handlebars.compile result
  ).property()
