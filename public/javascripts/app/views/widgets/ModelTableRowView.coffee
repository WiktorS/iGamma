App.ModelTableRowView = Em.View.extend
  tagName: "tr"

  columns: null
  content: null

  template: (->
    columns = @get "columns"
    content = @get "content"
    result = ""
    if content? 
      Em.assert "Table content is '#{@get("controller.constructor").toString()}' not Ember Object - forgot to map model lists?", content instanceof Em.Object
      result += "{{#if view.isIdle}}"
      result += "<td colspan=\"#{columns.length}\">&nbsp;</td>"
      result += "{{/if}}"
      result += "{{#if view.isLoading}}"
      result += "{{view App.SpinnerView tagName=\"td\" colspan=\"#{columns.length}\"}}"
      result += "{{/if}}"
      result += "{{#if view.isReady}}"
      for column, i in columns
        viewClass = column.get "data.viewClass"
        columnName = column.get "name"
        Em.assert "Field '#{columnName}' defined in '#{@get("controller.constructor").toString()}' does not exist in table content", viewClass || "undefined" != typeof content.get(columnName)
        cellClass = (viewClass ? "App.ModelTableCellView").toString()
        result += "{{view #{cellClass} contentBinding=\"view.content\" columnBinding=\"view.columns.#{i}\"}}"
      result += "{{/if}}"
      result += "{{#if view.isError}}"
      result += "<td colspan=\"#{columns.length}\" class=\"error\">Błąd pobierania danych. <a {{action retryFetch target=\"view\"}}>Ponów próbę</a></td>"
      result += "{{/if}}"
    Em.Handlebars.compile result
  ).property("columns.@each", "content")

  isIdle: (->
    App.GammaObjectStatus.IDLE == @get "content._dataStatus"
    ).property("content._dataStatus")

  isLoading: (->
    App.GammaObjectStatus.LOADING == @get "content._dataStatus"
    ).property("content._dataStatus")

  isReady: (->
    App.GammaObjectStatus.READY == @get "content._dataStatus"
    ).property("content._dataStatus")

  isError: (->
    App.GammaObjectStatus.ERROR == @get "content._dataStatus"
    ).property("content._dataStatus")

  didInsertElement: ->
    @.$().bind "inview", (event, isInView, visiblePartX, visiblePartY) =>
      if isInView
        row = @get "content"
        if row.get("_dataStatus") == App.GammaObjectStatus.IDLE
          tableView = @get "parentView"
          if tableView instanceof App.ModelTableView
            tableView.fetchQueueAppend row
            #once we queue item we can release event
            @.$().unbind "inview"

  willDestroyElement: ->
    @.$().unbind "inview"

  retryFetch: ->
    row = @get "content"
    if row.get("_dataStatus") != App.GammaObjectStatus.READY
      tableView = @get "parentView"
      if tableView instanceof App.ModelTableView
        #use fetchQueue mechanism, but maybe its better to call directly - its unlike to fetch several records this way
        tableView.fetchQueueAppend row
