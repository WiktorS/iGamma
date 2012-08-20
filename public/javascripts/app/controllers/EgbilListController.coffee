App.EgbilListController = Em.ArrayController.extend
  init: ->
    @_super()
    @clearData()

  clearData: -> @set "content", []
  close: -> App.router.transitionTo "egbil.search"