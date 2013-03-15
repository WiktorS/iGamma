App.EgbilObjectPersonController = App.GammaObjectCommonController.extend
  columnsOrder:
    person: ["pesel", "surname", "firstName", "secondName", "sex", "fatherName", "motherName", "citizenship", "status", "nip", "identityDocument", "address", "mailingAddress", "alive", "remarks", "notes"]
    lot: ["check", "show", "marker", "lotPersonKind", "jrg", "lot", "sheet", "precinct", "cadastralUnit", "cadastralArea", "lotShareCharacter", "lotShareGroup", "lotShareValue"]
    building: ["check", "show", "marker", "buildingPersonKind", "jrg", "jrb", "building", "lots", "sheet", "precinct", "cadastralUnit", "buildingKind", "highestLevel"]
    local: ["check", "show", "marker", "localPersonKind", "jrg", "jrl", "local", "address", "documents", "localKind"]

  personColumns: (-> App.Columns.getColumns(@get "columnsOrder.person")).property()
  lotColumns: (-> App.Columns.getColumns(@get "columnsOrder.lot")).property()
  buildingColumns: (-> App.Columns.getColumns(@get "columnsOrder.building")).property()
  localColumns: (-> App.Columns.getColumns(@get "columnsOrder.local")).property()
