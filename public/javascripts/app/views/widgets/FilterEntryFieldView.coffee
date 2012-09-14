App.FilterEntryFieldView = Em.View.extend
  templateName: "filterTextField"
  tagName: "span"
  init: ->
    @_super()
    if @element.type=="select"
      @templateName = "filterSelect"
    if @element.type=="range"
      @templateName = "filterRange"
    if @element.type=="calendar"
      @templateName = "filterCalendar"
  clearField: (event) ->
    @element.set "value", ""
    @element.set "alternateValue", ""

  didInsertElement: ->
    @_super()
    @get("parentView").pushFormField? @get("element")
