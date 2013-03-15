App.EgbilObjectLocalController = App.GammaObjectCommonController.extend
  columnsOrder:
    localLeft: ["precinct", "local","lot","building","usableArea","localKind","roomsNumber","address","localLevel","commonPropertyShare","remarks","notes"]
    localMiddle: ["jrg","jrl"]
    document: ["documentKind", "document"]
    premise: ["building", "premiseKind", "premiseArea"]
    right: ["entity","address","shareG","shareB","shareL"]

  localLeftColumns: (-> App.Columns.getColumns(@get "columnsOrder.localLeft")).property()
  localMiddleColumns: (-> App.Columns.getColumns(@get "columnsOrder.localMiddle")).property()
  documentColumns: (-> App.Columns.getColumns(@get "columnsOrder.document")).property()
  premiseColumns: (-> App.Columns.getColumns(@get "columnsOrder.premise")).property()
  rightColumns: (-> App.Columns.getColumns(@get "columnsOrder.right")).property()
