App.EgbilSearchLotsModel = Em.Object.extend
  jrgNumber: App.StandardFilterElementModel.create
    label: "Numer JRG"
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%][,]"
  area: App.StandardFilterElementModel.create
    label: "Powierzchnia ewidencyjna"
  terrainCategoryIdentifier: App.StandardFilterElementModel.create
    label: "Oznaczenie"
  terrainCategoryArea: App.StandardFilterElementModel.create
    label: "Powierzchnia"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
    help: "[%]"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
    help: "[%]"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer porządkowy"
    help: "[%]"
  lotSignature: App.StandardFilterElementModel.create
    label: "Dokument działki"
    help: "[%]"
