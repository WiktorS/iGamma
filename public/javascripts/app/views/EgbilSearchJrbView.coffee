App.EgbilSearchJrbView = App.EgbilSearchCommonView.extend
  templateName: "egbilSearchJrb"

  init: ->
    @_super()
    @hiddenSearchField()

  hiddenSearchField: ->
    @pushFormField Em.Object.create
      name: "type"
      value: "jrb"
