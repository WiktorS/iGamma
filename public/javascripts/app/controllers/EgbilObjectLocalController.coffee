App.EgbilObjectLocalController = Em.Controller.extend
  content: null

  localColumns:
    ["precinct", "number","lot","building","usableArea","type","roomsNumber","address","level","commonPropertyShare","remarks","notes"]
  localColumns1:
    ["jrgNumber","jrlNumber"]
  documentColumns:
    ["type", "sygnature"]
  rightColumns:
    ["entity","address","landShares","buildingShares","localShares"]
