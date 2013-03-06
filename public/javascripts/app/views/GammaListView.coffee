App.GammaListView = Em.View.extend
  templateName: "gammaList"
  layout: null
  didInsertElement: ->
    @set "layout", @$().layout
      defaults:
        resizable: false
        slidable: false
        closable: true
      east:
        initClosed: !(@get("controller.isAnyChecked") && @get("controller.canShowRightPanel"))
    layout = @get "layout"
    #disable closable here (force hide) - don't do it in options above, because we do need "toggle" later
    if layout.east.state.isClosed && layout.east.options.closable
      layout.disableClosable("east", true)
  _checkedItemsCountChanged: (->
    layout = @get("layout")
    if layout?
      if @get("controller.isAnyChecked")  && @get("controller.canShowRightPanel")
        if !layout.east.options.closable
          layout.enableClosable("east")
          layout.open "east"
      else
        layout.close "east"
        if layout.east.options.closable
          layout.disableClosable("east", true)
    ).observes("controller.isAnyChecked", "controller.canShowRightPanel")
