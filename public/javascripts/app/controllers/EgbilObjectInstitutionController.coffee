App.EgbilObjectInstitutionController = App.GammaObjectCommonController.extend
  columnsOrder:
    institution: ["fullName", "shortName", "status", "regon", "nip", "address", "registerName", "registerNumber", "registerCourt", "remarks", "notes"]
    lot: ["check", "show", "marker", "lotPersonKind", "jrg", "lot", "sheet", "precinct", "cadastralUnit", "cadastralArea", "lotShareCharacter", "lotShareGroup", "lotShareValue"]
    building: ["check", "show", "marker", "buildingPersonKind", "jrg", "jrb", "building", "lots", "sheet", "precinct", "cadastralUnit", "buildingKind", "highestLevel"]
    local: ["check", "show", "marker", "localPersonKind", "jrg", "jrl", "local", "address", "documents", "localKind"]
    landCommunity: ["check","marker", "landCommunity", "address", "landCommunityInstitution"]

  institutionColumns: (-> App.columnsData.getColumns(@get "columnsOrder.institution")).property()
  lotColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lot")).property()
  buildingColumns: (-> App.columnsData.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.columnsData.getColumns(@get "columnsOrder.local")).property()
  landCommunityColumns: (-> App.columnsData.getColumns(@get "columnsOrder.landCommunity")).property()
