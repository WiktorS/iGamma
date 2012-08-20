App.EgbilSearchModel = Em.Object.extend

  jrgNumber: App.StandardFilterElementModel.create
    label: "Numer JRG"
  jrbNumber: App.StandardFilterElementModel.create
    label: "Numer JRB"
  jrlNumber: App.StandardFilterElementModel.create
    label: "Numer JRL"

  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%][,]"
  lotArea: App.StandardFilterElementModel.create
    label: "Pow. ewidencyjna"

  terrainCategoryIdentifier: App.StandardFilterElementModel.create
    label: "Oznaczenie"
  terrainCategoryArea: App.StandardFilterElementModel.create
    label: "Powierzchnia"

  buildingNumber: App.StandardFilterElementModel.create
    label: "Numer budynku"
    help: "[%]"
  buildingArea: App.StandardFilterElementModel.create
    label: "Powierzchnia zabudowy"
  buildingType: App.StandardFilterElementModel.create
    label: "Rodzaj"
  buildingHighestLevel: App.StandardFilterElementModel.create
    label: "Nr najwyższej kondygn."
  buildingLowestLevel: App.StandardFilterElementModel.create
    label: "Nr najniższej kondygn."

  localNumber: App.StandardFilterElementModel.create
    label: "Numer ewid. lokalu"
    help: "[%]"
  localArea: App.StandardFilterElementModel.create
    label: "Powierzchnia użytkowa"
  localType: App.StandardFilterElementModel.create
    label: "Typ lokalu"
  localRoomsCount: App.StandardFilterElementModel.create
    label: "Liczba izb"

  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
    help: "[%]"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
    help: "[%]"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer porządkowy"
    help: "[%]"
  flatNumber: App.StandardFilterElementModel.create
    label: "Numer lokalu"
    help: "[%]"

  signatureLot: App.StandardFilterElementModel.create
    label: "Dokument działki"
    help: "[%]"
  signatureBuilding: App.StandardFilterElementModel.create
    label: "Dokument budynku"
    help: "[%]"
  signatureLocal: App.StandardFilterElementModel.create
    label: "Dokument lokalu"
    help: "[%]"

  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false
