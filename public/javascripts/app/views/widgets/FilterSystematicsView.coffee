App.FilterSystematicsView = Em.View.extend
  templateName: "filterSystematics"
  classNames: ["row"]

  didInsertElement: ->
    @_super()
    @get("parentView").pushFormField? @get("element")