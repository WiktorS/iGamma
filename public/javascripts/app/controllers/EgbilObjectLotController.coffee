App.EgbilObjectLotController = App.GammaObjectCommonController.extend
  columnsOrder:
    lotLeft: ["precinct", "lot", "cadastralArea", "geodesicArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "remarks", "notes"]
    lotMiddle: ["jrg"]
    address: [ "address" ]
    document: ["documentKind", "document"]
    terrainCategory: ["terrainCategoryKind", "terrainCategoryArea"]
    building: ["show","marker","building","buildingKind","jrb"]
    share: ["check", "marker", "characterB", "shareValue", "registerGroupB", "groupKind", "entity", "peselRegon", "address", "shareRemarks", "personRemarks"]

  lotLeftColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lotLeft")).property()
  lotMiddleColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lotMiddle")).property()
  addressColumns: (-> App.columnsData.getColumns(@get "columnsOrder.address")).property()
  documentColumns: (-> App.columnsData.getColumns(@get "columnsOrder.document")).property()
  terrainCategoryColumns: (-> App.columnsData.getColumns(@get "columnsOrder.terrainCategory")).property()
  buildingColumns: (-> App.columnsData.getColumns(@get "columnsOrder.building")).property()
  shareColumns: (-> App.columnsData.getColumns(@get "columnsOrder.share")).property()
