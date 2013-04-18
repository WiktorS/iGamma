App.PrintRadioGroupView = Em.View.extend
  value: null
  disabled: null
  groupName: null

  _valueChanged: (->
    value = @get "value"
    selector = ""
    if (groupName = @get "groupName")
      selector = "[name='#{groupName}']"
    @$("input:radio#{selector}[value='#{value}']").prop("checked",true)
    ).observes("value")

  init: ->
    @_super()
    @on "change", @, @_updateElementValue
    if !@get("groupName")
      #@valueBinding?._from.split(".").pop()
      @set "groupName", @valueBinding?._from.replace(/^.*\.(.*)$/, "$1") ? Em.guidFor @

  _updateElementValue: ->
    selector = ""
    if (groupName = @get "groupName")
      selector = "[name='#{groupName}']"
    @set "value", @$("input:radio#{selector}:checked").val()

  didInsertElement: ->
    @notifyPropertyChange("value") if (value = @get "value")
