App.PrintsView = Em.View.extend
  templateName: "prints"

  didInsertElement: ->
    @set "controller.printForm", @$("form")
