App.EgbilObjectOldJrgController = App.EgbilObjectCommonController.extend
  registerUnitContent: (-> Em.makeArray(@get "content")).property("content")

  columnsOrder:
    registerUnit: ["show", "jrg", "creationProof", "creationDate", "shareGroup", "remarks"]
    share: ["check","marker", "characterG", "shareValue", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]
    lot: ["check","show", "marker", "lot", "cadastralArea", "geodesicArea", "addresses", "documents", "terrainCategory", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "cadastralValue", "valuationDate", "remarks"]

  registerUnitColumns: (-> App.columnsData.getColumns(@get "columnsOrder.registerUnit")).property()
  shareColumns: (-> App.columnsData.getColumns(@get "columnsOrder.share")).property()
  lotColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lot")).property()
