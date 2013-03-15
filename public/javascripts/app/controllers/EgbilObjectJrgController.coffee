App.EgbilObjectJrgController = App.GammaObjectCommonController.extend
  registerUnitContent: (-> Em.makeArray(@get "content")).property("content")

  columnsOrder:
    registerUnit: ["show", "jrg", "jrb", "cadastralArea", "landRegister", "creationProof", "creationDate", "householdKind", "regon", "remarks", "notes"]
    share: ["check","marker", "characterG", "characterB", "shareValue", "registerGroupG", "registerGroupB", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]
    lot: ["check","show", "marker", "lot", "cadastralArea", "geodesicArea", "addresses", "documents", "terrainCategory", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "cadastralValue", "valuationDate", "remarks"]
    building: ["check","show", "marker", "building", "jrb", "documents", "buildingArea", "usableArea", "buildingStatus", "buildingKind", "buildingClass", "highestLevel", "lowestLevel", "addresses", "lotsJR", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exteriorWallsMaterial", "numberOfLocals", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
    local: ["check","show", "marker", "local", "jrl", "address", "documents", "usableArea", "localKind", "associatedPremises", "associatedPremisesAreaSum", "roomsNumber", "localLevel", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]

  registerUnitColumns: (-> App.Columns.getColumns(@get "columnsOrder.registerUnit")).property()
  shareColumns: (-> App.Columns.getColumns(@get "columnsOrder.share")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
  buildingColumns: (-> App.Columns.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.Columns.getColumns(@get "columnsOrder.local")).property()
