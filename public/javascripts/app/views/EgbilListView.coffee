App.EgbilListView = Em.View.extend
  templateName: "egbilList"
  didInsertElement: ->
    @$().layout
      defaults:
        resizable: false
        slidable: true
        closable: true
      east:
        initClosed: !@get "controller.isAnyChecked"


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
