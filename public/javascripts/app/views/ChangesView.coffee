App.ChangesView = Em.View.extend
  templateName: "changes"
  didInsertElement: ->
    App.layout.initContent "center"
