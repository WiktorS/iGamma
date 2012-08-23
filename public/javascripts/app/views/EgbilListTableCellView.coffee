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
