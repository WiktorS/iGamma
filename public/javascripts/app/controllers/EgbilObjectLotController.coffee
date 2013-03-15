App.EgbilObjectLotController = App.GammaObjectCommonController.extend
  columnsOrder:
    lotLeft: ["precinct", "lot", "cadastralArea", "geodesicArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "remarks", "notes"]
    lotMiddle: ["jrg"]
    address: [ "address" ]
    document: ["documentKind", "document"]
    terrainCategory: ["terrainCategoryKind", "terrainCategoryArea"]
    building: ["show","marker","building","buildingKind","jrb"]
    share: ["check", "marker", "characterB", "shareValue", "registerGroupB", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]

  lotLeftColumns: (-> App.Columns.getColumns(@get "columnsOrder.lotLeft")).property()
  lotMiddleColumns: (-> App.Columns.getColumns(@get "columnsOrder.lotMiddle")).property()
  addressColumns: (-> App.Columns.getColumns(@get "columnsOrder.address")).property()
  documentColumns: (-> App.Columns.getColumns(@get "columnsOrder.document")).property()
  terrainCategoryColumns: (-> App.Columns.getColumns(@get "columnsOrder.terrainCategory")).property()
  buildingColumns: (-> App.Columns.getColumns(@get "columnsOrder.building")).property()
  shareColumns: (-> App.Columns.getColumns(@get "columnsOrder.share")).property()
