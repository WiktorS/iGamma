App.EgbilSearchJrgibView = App.EgbilSearchCommonView.extend
  templateName: "egbilSearchJrgib"

  init: ->
    @_super()
    @hiddenSearchField()

  hiddenSearchField: ->
    @pushFormField Em.Object.create
      name: "type"
      value: "jrgib"
