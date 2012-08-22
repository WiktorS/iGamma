App.EgbilListController = Em.ArrayController.extend
  columns: null

  init: ->
    @_super()
    @clearData()

  clearData: ->
    @set "content", Em.A()
    @set "columns", Em.A()
