App.EgbilListController = Em.ArrayController.extend
  content: null
  columns: null
  title: null
  type: null

  checkedList: (->
    @get("content").filterProperty "isChecked"
    ).property("content.@each.isChecked")
  isAnyChecked: (->
    !Em.empty @get("checkedList")
    ).property("checkedList")
  isMultipleChecked: (->
    @get("checkedList").length > 1
    ).property("checkedList")
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
  objectNameColumn: (->
    type = @get "type"
    checked = @get "checkedList.0"
    for own key of checked
      value = checked.get key
      if value instanceof App.StandardTableCellModel
        if value.get("valueType") == type && value.get("value")?
          return key
    ).property("type", "checkedList.0")
  rightPanelSelectedObjects: (->
    type = @get "type"
    objectNameColumn = @get "objectNameColumn"
    Em.assert "List doesn't contain column of type: #{type}", objectNameColumn
    listMappingFunc = (x) ->
      @create
        objectName: x.get "#{objectNameColumn}.value"
        objectType: type
    @get("checkedList").map listMappingFunc, Em.Object
    ).property("type", "checkedList", "objectNameColumn")