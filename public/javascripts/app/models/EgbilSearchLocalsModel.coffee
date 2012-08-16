App.EgbilSearchLocalsModel = Em.Object.extend
  jrlNumber: App.StandardFilterElementModel.create
    label: "Numer JRL"
  registrationNumber: App.StandardFilterElementModel.create
    label: "Numer ewidencyjny"
    help: "[%]"
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%][,]"
  usefulArea: App.StandardFilterElementModel.create
    label: "Powierzchnia użytkowa"
  localType: App.StandardFilterElementModel.create
    label: "Typ lokalu"
  roomsCount: App.StandardFilterElementModel.create
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
  localNumber: App.StandardFilterElementModel.create
    label: "Numer lokalu"
    help: "[%]"
  localSignature: App.StandardFilterElementModel.create
    label: "Dokument lokalu"
    help: "[%]"
