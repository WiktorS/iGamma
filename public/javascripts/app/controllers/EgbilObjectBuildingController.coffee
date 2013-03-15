App.EgbilObjectBuildingController = App.GammaObjectCommonController.extend
  columnsOrder:
    address: ["address"]
    buildingLeft: ["precinct", "building","buildingArea","usableArea","buildingStatus","buildingKind","buildingClass","highestLevel","lowestLevel","numberOfLevels","constructionFinishDate","constructionFinishDateCertainty","reconstructionFinishDate","reconstructionFinishDateCertainty","reconstructionScope","exteriorWallsMaterial","monumentRegister","manyJRG", "remarks", "notes"]
    buildingMiddle: ["jrg","jrb"]
    document: ["documentKind", "document"]
    local: ["local","address","jrl"]
    lot: ["show","marker","precinct","lot","cadastralArea"]

  addressColumns: (-> App.Columns.getColumns(@get "columnsOrder.address")).property()
  buildingLeftColumns: (-> App.Columns.getColumns(@get "columnsOrder.buildingLeft")).property()
  buildingMiddleColumns: (-> App.Columns.getColumns(@get "columnsOrder.buildingMiddle")).property()
  documentColumns: (-> App.Columns.getColumns(@get "columnsOrder.document")).property()
  localColumns: (-> App.Columns.getColumns(@get "columnsOrder.local")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
