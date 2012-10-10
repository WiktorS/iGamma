App.EgbilListController = Em.ArrayController.extend
  content: null
  columns: null
  title: null
  type: null

  isAnyChecked: (->
    !Em.empty(@get("content").findProperty "isChecked", true)
    ).property("content.@each.isChecked")
  isMultipleChecked: (->
    (@get("content").filterProperty "isChecked").length > 1
    ).property("content.@each.isChecked")
  rightPaneContent: (->
    data = @get ["target.egbilController.rightPaneData", @get "type"].join(".")
    if @get "isAnyChecked"
      if @get "isMultipleChecked"
        data.filterProperty "multiselect", true
      else
        data
    ).property("type", "isAnyChecked", "isMultipleChecked")
