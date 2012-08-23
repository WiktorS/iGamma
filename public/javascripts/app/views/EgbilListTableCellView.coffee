App.EgbilListTableCellView = Em.View.extend
  tagName: "td"
  value: null
  template: (->
    value = @get "value"
    Em.Handlebars.compile value
  ).property()

App.EgbilListTableCellCheckBoxView = App.EgbilListTableCellView.extend
  template: Em.Handlebars.compile "<input type=\"checkbox\"/>"

App.EgbilListTableCellShowView = App.EgbilListTableCellView.extend
  template:
    Em.Handlebars.compile "<a href=\"#\" rel=\"tooltip\" title=\"Pokaż\"><i class=\"icon-search\"></i></a>"
  didInsertElement: ->
    this.$("a").tooltip
      placement: "bottom"
      delay:
        show: 3000
        hide: 300
