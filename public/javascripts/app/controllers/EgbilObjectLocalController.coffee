App.EgbilObjectLocalController = Em.Controller.extend
  content: null

  localColumns:
    ["precinct", "number","lot","building","usableArea","type","roomsNumber","address","level","commonPropertyShare","remarks","notes"]
  localColumns1:
    ["jrgNumber","jrlNumber"]
  documentColumns:
    ["type", "sygnature"]
  premiseColumns:
    ["building", "type", "area"]
  rightColumns:
    ["entity","address","landShares","buildingShares","localShares"]
