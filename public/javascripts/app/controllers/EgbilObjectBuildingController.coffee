App.EgbilObjectBuildingController = Em.Controller.extend
  content: null

  buildingColumns:
    ["precinct", "buildingNumber","buildUpArea","usableArea","status","type","classType","highestLevel","lowestLevel","numberOfLevels","constructionFinishDate","constructionFinishDateCertainty","reconstructionFinishDate","reconstructionFinishDateCertainty","reconstructionScope","exteriorWallsMaterial","monumentRegister","manyJRG", "remarks", "notes"]
  buildingColumns1:
    ["jrgNumber","jrbNumber"]
  lotColumns:
    ["show","marker","precinct","lotNumber","registeredArea"]
  buildingColumns2:
    ["addresses"]
  documentColumns:
    ["type", "sygnature"]
  localColumns:
    ["number","address","jrlNumber"]
