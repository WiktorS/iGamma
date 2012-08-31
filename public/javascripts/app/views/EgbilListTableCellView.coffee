App.EgbilListTableCellView = Em.View.extend
  tagName: "td"
  value: null
  type: null
  defaultTemplate: Em.Handlebars.compile "{{value}}"

App.EgbilListTableCellCheckBoxView = App.EgbilListTableCellView.extend
  template: Em.Handlebars.compile "<input type=\"checkbox\"/>"

App.EgbilListTableCellShowView = App.EgbilListTableCellView.extend
  templateName: "egbilListTableCellShow"
  didInsertElement: ->
    this.$("a").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300
  map: -> App.router.transitionTo "egbil.map"

App.EgbilListTableCellMarkerView = App.EgbilListTableCellView.extend
  tooltip: null
  template: Em.Handlebars.compile "<span title=\"{{tooltip}}\">{{value}}</span>"
  didInsertElement: ->
    this.$("span").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300

App.EgbilListTableCellButtonView = App.EgbilListTableCellView.extend
  templateName: "egbilListTableCellButton"
  didInsertElement: ->
    this.$("button").on "click", =>
      App.router.send "showObject", App.EgbilObjectInfo.create {name: @get("value"), type: @get("type")}
