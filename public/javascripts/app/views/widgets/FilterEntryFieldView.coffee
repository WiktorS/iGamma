App.FilterEntryFieldView = Em.View.extend
  templateName: "filterTextField"
  tagName: "span"
  dictionary: null
  dictionaryList: null

  init: ->
    @_super()
    if @get("field.type") == "select"
      @set "templateName", "filterSelect"
    if @get("field.type") == "range"
      @set "templateName", "filterRange"
    if @get("field.type") == "calendar"
      @set "templateName", "filterCalendar"
    if @get("field.dictionary") == "towns"
      @set "dictionaryList", Em.A([ "Poznań", "Warszawa", "Wrocław", "Kraków" ])
    if @get("field.dictionary") == "streets"
      @set "dictionaryList", Em.A([ "Poznańska", "Warszawska", "Wrocławska", "Krakowska" ])

  clearField: (event) ->
    @set "field.value", ""
    @set "field.alternateValue", ""

  didInsertElement: ->
    @_super()
    @get("controller").appendSearchField? @get("field"), @get("attrIndex")
    if @get("field.type") == "calendar"
      @$("input").datepicker
        format: 'dd-mm-yyyy'
        weekStart: 1
        autoclose: true
        language: 'pl'
    if @get("field.type") == "select"
      @$('select').combobox()

  change: (event) ->
    if @get("field.value") > @get("field.alternateValue") && @get("field.alternateValue")
      alert "Wartość z pola od nie może być\n większa niż wartość z pola do"

  showCalendar: (event) ->
    @$("input").focus() # @$("input").datepicker 'show'
