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
    @get("parentView").pushFormField? @get "field"
    if @get("field.type") == "calendar"
      @$("input").datepicker
        format: 'dd-mm-yyyy'
        weekStart: 1
        autoclose: true
        language: 'pl'

  checkRange: (event) ->
    if @get("field.value") > @get("field.alternateValue")
      alert "Wartość z pola od nie może być\n większa niż wartość z pola do"

  showCalendar: (event) ->
    @$("input").datepicker 'show'

