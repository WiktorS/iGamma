App.ModelTableHeaderView = Em.View.extend
  tagName: "th"

  column: null
  content: null

  template: (->
    Em.Handlebars.compile( @get("content.0")?.get(@get "column")?.label ? "")
  ).property("content", "column")
