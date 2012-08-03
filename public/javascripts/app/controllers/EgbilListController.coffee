App.EgbilListController = Em.Controller.extend
  content: []
  clearData: -> @set 'content', []
  loadData: ->
    $.getJSON('/getRegisterUnits.json', (data) =>
      @set 'content',data
    )
    App.router.transitionTo 'lista'
