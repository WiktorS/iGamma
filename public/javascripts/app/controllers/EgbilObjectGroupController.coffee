App.EgbilObjectGroupController = App.EgbilObjectCommonController.extend
  columnsOrder:
    group: ["fullName", "shortName", "status", "regon", "nip", "address", "registerName", "registerNumber", "registerCourt", "remarks", "notes"]
    lot: ["check", "show", "marker", "personKind", "jrg", "lot", "sheet", "precinct", "cadastralUnit", "cadastralArea", "lotShareCharacter", "lotShareGroup", "lotShareValue"]
    building: ["check", "show", "marker", "personKind", "jrg", "jrb", "building", "lots", "sheet", "precinct", "cadastralUnit", "buildingKind", "highestLevel"]
    local: ["check", "show", "marker", "personKind", "jrg", "jrl", "local", "address", "document", "localKind"]
    member: ["check", "marker", "personKind", "memberEntity", "memberAddress", "memberPeselRegon", "memberNip"]

  groupColumns: (-> App.columnsData.getColumns(@get "columnsOrder.group")).property()
  lotColumns: (-> App.columnsData.getColumns(@get "columnsOrder.lot")).property()
  buildingColumns: (-> App.columnsData.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.columnsData.getColumns(@get "columnsOrder.local")).property()
  memberColumns: (-> App.columnsData.getColumns(@get "columnsOrder.member")).property()
