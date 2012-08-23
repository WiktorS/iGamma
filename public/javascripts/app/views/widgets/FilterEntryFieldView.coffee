App.FilterEntryFieldView = Em.View.extend
  templateName: "filterTextField"
  tagName: "span"
  init: ->
    @_super()
    if @element.type=="select"
      @templateName = "filterSelect"
  clearField: (event) ->
    @element.set "value", ""
