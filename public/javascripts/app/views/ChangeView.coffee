App.ChangeView = Em.View.extend
  templateName: "change"
  didInsertElement: ->
    App.layout.initContent "center"
