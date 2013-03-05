App.FilterEntryFieldView = Em.View.extend
  templateName: "filterTextField"
  tagName: "span"

  init: ->
    @_super()
    if @get("field.type") == "select"
      @set "templateName", "filterSelect"
    if @get("field.type") == "range"
      @set "templateName", "filterRange"
    if @get("field.type") == "calendar"
      @set "templateName", "filterCalendar"

  clearField: (event) ->
    @set "field.value", ""
    @set "field.alternateValue", ""

  didInsertElement: ->
    @_super()
#   parentView must extend EgbilSearchCommonView class
    @get("parentView").pushFormField? @get("field"), @get("attrIndex")
