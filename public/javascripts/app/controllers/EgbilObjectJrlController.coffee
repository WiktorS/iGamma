App.EgbilObjectJrlController = App.GammaObjectCommonController.extend
  registerUnitContent: (-> Em.makeArray(@get "content")).property("content")

  columnsOrder:
    registerUnit: ["show", "jrl", "landRegister", "creationProof", "creationDate", "remarks", "notes" ]
    share: ["check","marker", "characterB", "shareValue", "registerGroupB", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]
    local: ["check","show", "marker", "local", "jrl", "address", "documents", "usableArea", "localKind", "associatedPremises", "associatedPremisesAreaSum", "roomsNumber", "localLevel", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]

  registerUnitColumns: (-> App.columnsData.getColumns(@get "columnsOrder.registerUnit")).property()
  shareColumns: (-> App.columnsData.getColumns(@get "columnsOrder.share")).property()
  localColumns: (-> App.columnsData.getColumns(@get "columnsOrder.local")).property()
