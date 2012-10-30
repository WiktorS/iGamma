App.EgbilSearchJrlView = App.EgbilSearchCommonView.extend
  templateName: "egbilSearchJrl"

  init: ->
    @_super()
    @hiddenSearchField()

  hiddenSearchField: ->
    @pushFormField Em.Object.create
      name: "type"
      value: "jrl"
