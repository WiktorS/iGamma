App.ShareSummaryModalView = App.ModalView.extend
  templateName: "shareSummaryModal"

  content: null
  objectType: null
  columns: (->
    type = @get "objectType"
    columnsOrder = @get "columnsOrder.#{type}"
    Em.assert "Column order in #{@get("constructor").toString()} is not defined for type '#{type}'", columnsOrder
    App.Columns.getColumns(columnsOrder)
    ).property("objectType")

  columnsOrder:
    jrb: ["registerGroupG", "shareValue"]
    jrg: ["registerGroupB", "shareValue"]
    jrl: ["registerGroupG", "shareValue"] #TODO
    oldJrg: ["registerGroupG", "shareValue"]
