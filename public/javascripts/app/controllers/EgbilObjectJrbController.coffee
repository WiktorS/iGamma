App.EgbilObjectJrbController = App.EgbilObjectCommonController.extend
  registerUnitContent: (-> Em.makeArray(@get "content")).property("content")

  columnsOrder:
    registerUnit: ["show", "jrb", "landRegister", "creationProof", "creationDate", "remarks", "notes" ]
    share: ["check","marker", "characterB", "shareValue", "registerGroupB", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]
    building: ["check","show", "marker", "building", "jrb", "documents", "buildingArea", "usableArea", "buildingStatus", "buildingKind", "buildingClass", "highestLevel", "lowestLevel", "addresses", "lotsJR", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exteriorWallsMaterial", "numberOfLocals", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
    local: ["check","show", "marker", "local", "jrl", "address", "documents", "usableArea", "localKind", "associatedPremises", "associatedPremisesAreaSum", "roomsNumber", "localLevel", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]

  registerUnitColumns: (-> App.columnsData.getColumns(@get "columnsOrder.registerUnit")).property()
  shareColumns: (-> App.columnsData.getColumns(@get "columnsOrder.share")).property()
  buildingColumns: (-> App.columnsData.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.columnsData.getColumns(@get "columnsOrder.local")).property()
