App.EgbilObjectLotController = Em.Controller.extend
  content: null

  documentColumns:
    ["type", "sygnature", "source", "creationDate", "receiptDate", "description", "designation", "relatedType", "relatedSygnature"]
  shareColumns:
    ["check", "marker", "characterB", "value", "registerGroupB", "groupType", "entity", "peselOrRegon", "address", "shareRemarks", "personRemarks"]