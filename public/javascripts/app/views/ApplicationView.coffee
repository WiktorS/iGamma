App.ApplicationView = Em.View.extend
  templateName: "application"

  didInsertElement: ->
    App.layout = @$().layout
      defaults:
        resizable: false
        slidable: false
        closable: false
        spacing_open: false
        findNestedContent: true
