App.EgbilObjectDocumentController = Em.Controller.extend
  content: null

  documentColumns:
    ["type", "sygnature", "source", "creationDate", "receiptDate", "description", "designation", "relatedType", "relatedSygnature"]
  lotColumns:
    ["check", "show", "marker", "g5", "registeredArea", "geodesicArea", "addresses", "documentsSygnature", "terrainCategoryType", "terrainCategoryArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "value", "valuationDate", "remarks"]
  buildingColumns:
    ["check", "show", "marker", "g5", "jrbNumber", "documentsSygnature", "buildUpArea", "usableArea", "status", "type", "classType", "highestLevel", "lowestLevel", "addresses", "lotNumber", "lotArea", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exteriorWallsMaterial", "numberOfUnits", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
  localColumns:
    ["check", "show", "marker", "g5", "jrlNumber", "address", "documentsSygnature", "usableArea", "localType", "associatedPremisesBuilding", "associatedPremisesType", "associatedPremisesArea", "associatedPremisesNumber", "roomsNumber", "tier", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]
  changeColumns:
    ["check", "changeNumber", "registerDate", "entryDate", "type", "status", "description"]
