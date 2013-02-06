App.ModelTableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]
  templateName: "modelTable"

  content: null
  columns: null

  fetchQueue: null
  fetchQueueTimeout: null
  dataProvider: null

  init: ->
    @_super()
    @fetchQueueReset()

  fetchQueueReset: ->
    @set "fetchQueue", Em.A()

  fetchQueueAppend: (item)->
    @get("fetchQueue").addObject item

  fetchQueueWorker: ->
    fetchQueue = @get "fetchQueue"
    for item in fetchQueue
      item.set "rowState", App.RowState.LOADING
    dataProvider = @get "dataProvider"
    Em.run.next(@, => dataProvider?.fetchData(fetchQueue))
    @fetchQueueReset()
