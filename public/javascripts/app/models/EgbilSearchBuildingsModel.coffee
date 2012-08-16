App.EgbilSearchBuildingsModel = Em.Object.extend
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%]"
  buildingNumber: App.StandardFilterElementModel.create
    label: "Numer budynku"
    help: "[%]"
  buildArea: App.StandardFilterElementModel.create
    label: "Powierzchnia zabudowy"
  usefulArea: App.StandardFilterElementModel.create
    label: "Powierzchnia użytkowa"
  buildingType: App.StandardFilterElementModel.create
    label: "Rodzaj"
  highestLevel: App.StandardFilterElementModel.create
    label: "Numer najwyższej kondygnacji"
  lowestLevel: App.StandardFilterElementModel.create
    label: "Numer najniższej kondygnacji"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
    help: "[%]"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
    help: "[%]"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer porządkowy"
    help: "[%]"
  buildingSignature: App.StandardFilterElementModel.create
    label: "Dokument budynku"
    help: "[%]"
