App.GammaObjectView = Em.View.extend
  templateName: "gammaObject"
  layout: null
  didInsertElement: ->
    @set "layout", @$().layout
      defaults:
        resizable: false
        slidable: false
        closable: true
      east:
        initClosed: true
