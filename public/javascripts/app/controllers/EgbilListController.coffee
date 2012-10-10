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
  canShowRightPanel: (->
    Em.A(@get ["target.egbilController.rightPanelData", @get "type"].join(".")).length > 0
    ).property("type")
  rightPanelContent: (->
    data = @get ["target.egbilController.rightPanelData", @get "type"].join(".")
    if @get("isAnyChecked") && @get("canShowRightPanel")
      if @get "isMultipleChecked"
        data.filterProperty "multiselect", true
      else
        data
    ).property("type", "isAnyChecked", "isMultipleChecked")
