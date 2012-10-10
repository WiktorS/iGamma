App.EgbilListView = Em.View.extend
  templateName: "egbilList"
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


App.EgbilListTableCellCheckBoxView = App.ModelTableCellView.extend
  template: Em.Handlebars.compile "{{view Ember.Checkbox  checkedBinding=\"view.content.value\"}}"


App.EgbilListTableCellShowMapView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellShow"
  didInsertElement: ->
    this.$("a").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300
  map: -> App.router.transitionTo "egbil.map"


App.EgbilListTableCellMarkerView = App.ModelTableCellView.extend
  tooltip: null
  template: Em.Handlebars.compile "<span title=\"{{tooltip}}\">{{view.displayValue}}</span>"
  didInsertElement: ->
    this.$("span").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300


App.EgbilListTableCellButtonView = App.ModelTableCellView.extend
  templateName: "egbilListTableCellButton"
