App.EgbilObjectJrbController = Em.Controller.extend
  content: null

  registerUnitContent: (-> Em.makeArray(@get "content.registerUnit")).property("content.registerUnit")

  registerUnitColumns:
    ["show", "jrbNumber", "kw", "creationProof", "creationDate", "remarks", "notes"]
  shareColumns:
    ["marker", "characterB", "value", "registerGroupB", "groupType", "entity", "peselOrRegon", "address", "shareRemarks", "personRemarks"]
  lotColumns:
    ["show", "marker", "g5", "registeredArea", "geodesicArea", "addresses", "documentsSygnature", "documentsSygnature", "useClassType", "useClassArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "value", "valuationDate", "remarks"]
  buildingColumns:
    ["show", "marker", "g5", "jrbNumber", "documentsSygnature", "buildUpArea", "usableArea", "status", "type", "class", "highestLevel", "lowestLevel", "addresses", "lotNumber", "lotArea", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exterioWallsMaterial", "numberOfUnits", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
  localColumns:
    ["show", "marker", "g5", "jrlNumber", "address", "documentsSygnature", "usableArea", "localType", "associatedPremisesBuilding", "associatedPremisesType", "associatedPremisesArea", "associatedPremisesNumber", "roomsNumber", "tier", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]
