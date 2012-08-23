App.EgbilListTableCellView = Em.View.extend
  tagName: "td"
  value: null
  defaultTemplate: (->
    value = @get "value"
    Em.Handlebars.compile value
  ).property()

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
  template: (->
    value = @get("value") ? ""
    tooltip = @get("tooltip") ? ""
    Em.Handlebars.compile "<span title=\"%@\">%@</span>".fmt(tooltip,value)
  ).property()
  didInsertElement: ->
    this.$("span").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300

App.EgbilListTableCellButtonView = App.EgbilListTableCellView.extend
  templateName: "egbilListTableCellButton"
  didInsertElement: ->
    this.$("button").on "click", ->
      App.router.transitionTo "changes" #TODO: transition to clicked object
