App.EgbilObjectView = Em.View.extend
  templateName: "egbilObject"
  layout: null
  didInsertElement: ->
    @set "layout", @$().layout
      defaults:
        resizable: false
        slidable: false
        closable: true
      east:
        initClosed: true
