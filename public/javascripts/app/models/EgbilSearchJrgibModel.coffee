App.EgbilSearchJrgibModel = Em.Object.extend
  jrgNumber: App.StandardFilterElementModel.create
    label: "Numer JRG"
  jrbNumber: App.StandardFilterElementModel.create
    label: "Numer JRB"
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%][,]"
  buildingNumber: App.StandardFilterElementModel.create
    label: "Numer budynku"
    help: "[%]"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
    help: "[%]"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
    help: "[%]"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer posesji"
    help: "[%]"
  lotSignature: App.StandardFilterElementModel.create
    label: "Dokument działki"
    help: "[%]"
  buildingSignature: App.StandardFilterElementModel.create
    label: "Dokument budynku"
    help: "[%]"
  localSignature: App.StandardFilterElementModel.create
    label: "Dokument lokalu"
    help: "[%]"
  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false

