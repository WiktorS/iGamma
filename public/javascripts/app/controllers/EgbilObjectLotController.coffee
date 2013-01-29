App.EgbilObjectLotController = Em.Controller.extend
  content: null

  lotColumns:
    ["precinct", "lotNumber", "registeredArea", "geodesicArea", "monumentRegister", "statisticalRegion", "listDistrict", "validFrom", "validTo", "remarks", "notes"]
  lotColumns1:
    ["jrgNumber", "addresses"]
  documentColumns:
    ["type", "sygnature"]
  useclassColumns:
    ["type", "area"]
  buildingColumns:
    ["show","marker","buildingNumber","type","jrbNumber"]
  shareColumns:
    ["check", "marker", "characterB", "value", "registerGroupB", "groupType", "entity", "peselOrRegon", "address", "shareRemarks", "personRemarks"]