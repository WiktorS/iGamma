App.EgbilObjectLocalController = App.EgbilObjectCommonController.extend
  columnsOrder:
    localLeft: ["precinct", "local","lot","building","usableArea","localKind","roomsNumber","address","localLevel","commonPropertyShare","remarks","notes"]
    localMiddle: ["jrg","jrl"]
    document: ["documentKind", "document"]
    premise: ["building", "premiseKind", "premiseArea"]
    right: ["entity","address","shareG","shareB","shareL"]

  localLeftColumns: (-> App.columnsData.getColumns(@get "columnsOrder.localLeft")).property()
  localMiddleColumns: (-> App.columnsData.getColumns(@get "columnsOrder.localMiddle")).property()
  documentColumns: (-> App.columnsData.getColumns(@get "columnsOrder.document")).property()
  premiseColumns: (-> App.columnsData.getColumns(@get "columnsOrder.premise")).property()
  rightColumns: (-> App.columnsData.getColumns(@get "columnsOrder.right")).property()
