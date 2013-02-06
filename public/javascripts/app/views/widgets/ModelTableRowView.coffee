App.ModelTableRowView = Em.View.extend
  tagName: "tr"

  columns: null
  content: null

  template: (->
    columns = @get "columns"
    content = @get "content"
    result = ""
    if content?
      result += "{{#if view.isIdle}}"
      result += "<td colspan=\"#{columns.length}\">&nbsp;</td>"
      result += "{{/if}}"
      result += "{{#if view.isLoading}}"
      result += "{{view App.SpinnerView tagName=\"td\" colspan=\"#{columns.length}\"}}"
      result += "{{/if}}"
      result += "{{#if view.isReady}}"
      $.each(columns, (i, field) ->
        cell = content.get field
        Ember.assert "Cell must inherit from App.StandardTableCellModel",cell instanceof App.StandardTableCellModel
        cellClass = (cell.get("viewClass") ? "App.ModelTableCellView").toString()
        result += "{{view #{cellClass} contentBinding=\"view.content.#{field}\"}}"
      )
      result += "{{/if}}"
      result += "{{#if view.isError}}"
      result += "<td colspan=\"#{columns.length}\" class=\"error\">Błąd pobierania danych. <a {{action retryFetch target=\"view\"}}>Ponów próbę</a></td>"
      result += "{{/if}}"
    Em.Handlebars.compile result
  ).property("columns.@each", "content.@each")

  isIdle: (->
    App.RowState.IDLE == @get "content.rowState"
    ).property("content.rowState")

  isLoading: (->
    App.RowState.LOADING == @get "content.rowState"
    ).property("content.rowState")

  isReady: (->
    App.RowState.READY == @get "content.rowState"
    ).property("content.rowState")

  isError: (->
    App.RowState.ERROR == @get "content.rowState"
    ).property("content.rowState")

  didInsertElement: ->
    @.$().bind "inview", (event, isInView, visiblePartX, visiblePartY) =>
      if isInView
        row = @get "content"
        if row.get("rowState") == App.RowState.IDLE
          tableView = @get "parentView"
          if tableView instanceof App.ModelTableView
            tableView.fetchQueueAppend row
            clearTimeout(tableView.get "fetchQueueTimeout")
            tableView.set "fetchQueueTimeout", setTimeout((=> tableView.fetchQueueWorker()), 100)
            #once we queue item we can release event
            @.$().unbind "inview"

  willDestroyElement: ->
    @.$().unbind "inview"

  retryFetch: ->
    row = @get "content"
    if row.get("rowState") != App.RowState.READY
      tableView = @get "parentView"
      if tableView instanceof App.ModelTableView
        #use fetchQueue mechanism, but maybe its better to call directly - its unlike to fetch several records this way
        tableView.fetchQueueAppend row
        clearTimeout(tableView.get "fetchQueueTimeout")
        tableView.set "fetchQueueTimeout", setTimeout((=> tableView.fetchQueueWorker()), 100)


#Row state in table (ModelTableView/ModelTableRowView)
App.RowState =
  IDLE: 1
  LOADING: 2
  READY: 3
  ERROR: 4
