App.EgbilObjectJrgibController = Em.Controller.extend
  content: null

  registerUnitContent: (-> Em.makeArray(@get "content.registerUnit")).property("content")

  registerUnitColumns:
    ["show", "jrgNumber", "jrbNumber", "area", "kw", "creationProof", "creationDate", "householdType", "regon", "remarks", "notes"]
  shareColumns:
    ["marker", "characterG", "characterB", "value", "registerGroupG", "registerGroupB", "groupType", "entity", "peselOrRegon", "address", "shareRemarks", "personRemarks"]
  lotColumns:
    ["show", "marker", "g5", "registeredArea", "geodesicArea", "addresses", "documentsSygnature", "documentsSygnature", "useClassType", "useClassArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "value", "valuationDate", "remarks"]
  buildingColumns:
    ["show", "marker", "g5", "jrbNumber", "documentsSygnature", "buildUpArea", "usableArea", "status", "type", "class", "highestLevel", "lowestLevel", "addresses", "lotNumber", "lotArea", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exterioWallsMaterial", "numberOfUnits", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
  localColumns:
    ["show", "marker", "g5", "jrlNumber", "address", "documentsSygnature", "usableArea", "localType", "associatedPremisesBuilding", "associatedPremisesType", "associatedPremisesArea", "associatedPremisesNumber", "roomsNumber", "tier", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]
