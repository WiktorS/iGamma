App.ChangesObjectChangeController = App.GammaObjectCommonController.extend
  columnsOrder:
    change: [ "systematics", "changeYear", "changeName", "applicationYear", "applicationNumber", "stockKerg", "applicationKind", "changeKind", "changeStatus", "changeDescription", "lotsAndLandRegister", "applicationEntity", "registeredBy", "introducedBy", "acceptedBy" ]
    document: [ "check", "documentKind", "document", "documentSource", "creationDate", "receiptDate", "description", "designation" ]
    lot: [ "check","show","marker","lot","precinct","cadastralUnit","jrg","addresses","documents","cadastralArea" ]
    member: [ "check", "memberEntity", "memberPeselRegon", "memberAddress" ]
    registerUnit: [ "check", "cadastralUnit", "precinct", "registerUnit", "registerUnitChangeBefore", "registerUnitChangeAfter" ]

  changeColumns: (-> App.columnsData.getColumns(@get "columnsOrder.change")).property()
  documentColumns: (-> App.columnsData.getColumns(@get "columnsOrder.document")).property()
  lotColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lot")).property()
  memberColumns: (-> App.columnsData.getColumns(@get "columnsOrder.member")).property()
  registerUnit: (-> App.columnsData.getColumns(@get "columnsOrder.registerUnit")).property()
