App.ChangesObjectChangeController = App.GammaObjectCommonController.extend
  columnsOrder:
    change: [ "systematics", "changeYear", "changeName", "applicationYear", "applicationNumber", "stockKerg", "applicationKind", "changeKind", "changeStatus", "changeDescription", "lotsAndLandRegister", "applicationEntity", "registeredBy", "introducedBy", "acceptedBy" ]
    document: [ "check", "documentKind", "document", "documentSource", "creationDate", "receiptDate", "description", "designation" ]
    lot: [ "check","show","marker","lot","precinct","cadastralUnit","jrg","addresses","documents","cadastralArea" ]
    member: [ "check", "memberEntity", "memberPeselRegon", "memberAddress" ]
    registerUnit: [ "check", "cadastralUnit", "precinct", "registerUnit", "registerUnitChangeBefore", "registerUnitChangeAfter" ]

  changeColumns: (-> App.Columns.getColumns(@get "columnsOrder.change")).property()
  documentColumns: (-> App.Columns.getColumns(@get "columnsOrder.document")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
  memberColumns: (-> App.Columns.getColumns(@get "columnsOrder.member")).property()
  registerUnit: (-> App.Columns.getColumns(@get "columnsOrder.registerUnit")).property()
