App.EgbilObjectGroupController = Em.Controller.extend
  content: null

  groupColumns:
    ["fullname", "shortname", "status", "regon", "nip", "address", "registername", "registernumber", "registercourt", "remarks", "notes"]
  lotColumns:
    ["check", "show", "marker", "g5", "registeredArea", "geodesicArea", "addresses", "documentsSygnature", "useClassType", "useClassArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "value", "valuationDate", "remarks"]
  buildingColumns:
    ["check", "show", "marker", "g5", "jrbNumber", "documentsSygnature", "buildUpArea", "usableArea", "status", "type", "classType", "highestLevel", "lowestLevel", "addresses", "lotNumber", "lotArea", "constructionFinishDate", "reconstructionFinishDate", "reconstructionScope", "exteriorWallsMaterial", "numberOfUnits", "monumentRegister", "cadastralValue", "valuationDate", "manyJRG", "remarks"]
  localColumns:
    ["check", "show", "marker", "g5", "jrlNumber", "address", "documentsSygnature", "usableArea", "type", "associatedPremisesBuilding", "associatedPremisesType", "associatedPremisesArea", "associatedPremisesNumber", "roomsNumber", "tier", "commonPropertyShare", "lot", "building", "cadastralValue", "valuationDate", "remarks"]
  memberColumns:
    ["check", "marker", "type", "surnameAndNames", "address", "pesel", "nip"]
