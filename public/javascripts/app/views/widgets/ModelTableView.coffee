App.ModelTableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]
  templateName: "modelTable"

  content: null
  columns: null
  header: true

  fetchQueue: null
  fetchQueueTimeout: null

  init: ->
    @_super()
    @fetchQueueReset()

  fetchQueueReset: ->
    @set "fetchQueue", Em.Object.create()
    @set "fetchQueueTimeout", Em.Object.create()

  fetchQueueAppend: (item)->
    #append item
    itemType = item.get "_objectType"
    Em.assert "Item appended to fetchQueue does not have object type", itemType
    @get("fetchQueue.#{itemType}") ? @set("fetchQueue.#{itemType}", Em.A())
    typeQueue = @get("fetchQueue.#{itemType}")
    typeQueue.addObject item
    #update timer
    typeTimeout = @get "fetchQueueTimeout.#{itemType}"
    clearTimeout typeTimeout
    @set "fetchQueueTimeout.#{itemType}", setTimeout((=> @fetchQueueWorker(itemType)), 100)

  fetchQueueWorker: (itemType)->
    fetchQueue = @get "fetchQueue.#{itemType}"
    for item in fetchQueue
      item.set "_dataStatus", App.EgbilObjectStatus.LOADING
    fetchFunction = @get("controller.fetchDataCallback")
    Em.assert "Controller #{@get("controller.constructor").toString()} does not define 'fetchDataCallback' function", fetchFunction
    Em.run.next(@, => fetchFunction.call(@get("controller"), fetchQueue, itemType))
    @set("fetchQueue.#{itemType}", Em.A())
