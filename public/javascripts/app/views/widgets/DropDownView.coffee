App.DropDownView = Em.View.extend
  templateName: "dropDown"
  content: null
  value: null

  displayValue: (->
    @get "value.name"
    ).property("value")

  selectItem: (item)->
    @set "value", item
