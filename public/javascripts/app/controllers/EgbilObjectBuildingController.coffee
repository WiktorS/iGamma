App.EgbilObjectBuildingController = App.EgbilObjectCommonController.extend
  columnsOrder:
    address: ["address"]
    buildingLeft: ["precinct", "building","buildingArea","usableArea","buildingStatus","buildingKind","buildingClass","highestLevel","lowestLevel","numberOfLevels","constructionFinishDate","constructionFinishDateCertainty","reconstructionFinishDate","reconstructionFinishDateCertainty","reconstructionScope","exteriorWallsMaterial","monumentRegister","manyJRG", "remarks", "notes"]
    buildingMiddle: ["jrg","jrb"]
    document: ["documentKind", "document"]
    local: ["local","address","jrl"]
    lot: ["show","marker","precinct","lot","cadastralArea"]

  addressColumns: (-> App.columnsData.getColumns(@get "columnsOrder.address")).property()
  buildingLeftColumns: (-> App.columnsData.getColumns(@get "columnsOrder.buildingLeft")).property()
  buildingMiddleColumns: (-> App.columnsData.getColumns(@get "columnsOrder.buildingMiddle")).property()
  documentColumns: (-> App.columnsData.getColumns(@get "columnsOrder.document")).property()
  localColumns: (-> App.columnsData.getColumns(@get "columnsOrder.local")).property()
  lotColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lot")).property()
