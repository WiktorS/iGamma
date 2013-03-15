App.EgbilObjectOldJrgController = App.GammaObjectCommonController.extend
  registerUnitContent: (-> Em.makeArray(@get "content")).property("content")

  columnsOrder:
    registerUnit: ["show", "jrg", "creationProof", "creationDate", "shareGroup", "remarks"]
    share: ["check","marker", "characterG", "shareValue", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]
    lot: ["check","show", "marker", "lot", "cadastralArea", "geodesicArea", "addresses", "documents", "terrainCategory", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "cadastralValue", "valuationDate", "remarks"]

  registerUnitColumns: (-> App.Columns.getColumns(@get "columnsOrder.registerUnit")).property()
  shareColumns: (-> App.Columns.getColumns(@get "columnsOrder.share")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
