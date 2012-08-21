App.TableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]

  columns: null

  init: ->
    @_super()
    columns = []

  template: (->
    columns = @get("columns").split ","
    content = @get "content"
    result = "<thead><tr>"
    result += "<th><input type=\"checkbox\"/></th>"
    result += "<th>Pokaż</th>"
    $.each(columns, (k,v) ->
      result += "<th>" + content[0]?.get(v)?.label + "</th>";
    )
    result += "</tr></thead>"
    result += "<tbody>"
    $.each(content, (i, item) ->
      result += "<tr>"
      result += "<td><input type=\"checkbox\"/></td>"
      result += "<td><i class=\"icon-search\"></i></td>"
      $.each(columns, (k,v) ->
        result += "<td>" + (item?.get(v)?.value ? "") + "</td>";
      )
      result += "</tr>"
    )
    result += "</tbody>"
    Em.Handlebars.compile result
  ).property()
