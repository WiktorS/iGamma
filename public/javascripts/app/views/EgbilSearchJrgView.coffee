App.EgbilSearchJrgView = App.EgbilSearchCommonView.extend
  templateName: "egbilSearchJrg"

  init: ->
    @_super()
    @hiddenSearchField()

  hiddenSearchField: ->
    @pushFormField Em.Object.create
      name: "type"
      value: "jrg"
