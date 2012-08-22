App.EgbilListTableHeaderView = Em.View.extend
  tagName: "th"

  column: null
  content: null

  init: ->
    @_super()
    content = Em.A()

  template: (->
    column = @get "column"
    content = @get "content"
    Em.Handlebars.compile content[0]?.get(column)?.label
  ).property()
