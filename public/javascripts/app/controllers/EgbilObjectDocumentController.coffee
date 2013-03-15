App.EgbilObjectDocumentController = App.GammaObjectCommonController.extend
  columnsOrder:
    document: [ "documentKind", "document", "documentSource", "creationDate", "receiptDate", "description", "designation", "relatedDocumentKind", "relatedDocument" ]
    lot: [ "check", "show", "marker", "lot", "precinct", "cadastralUnit", "jrg", "address", "cadastralArea" ]
    building: [ "check","show","marker","building","lots","precinct","cadastralUnit","jrg","jrb","buildingKind","constructionFinishDate","buildingArea" ]
    local: [ "check","show","marker","local","address","documents","precinct","cadastralUnit","jrg","jrl","usableArea","lot","building" ]
    change: [ "check", "change", "changeYear", "applicationYear", "changeKind", "changeStatus", "changeDescription" ]

  documentColumns: (-> App.Columns.getColumns(@get "columnsOrder.document")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
  buildingColumns: (-> App.Columns.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.Columns.getColumns(@get "columnsOrder.local")).property()
  changeColumns: (-> App.Columns.getColumns(@get "columnsOrder.change")).property()
