App.EgbilSearchJrbModel = Em.Object.extend
  jrbNumber: App.StandardFilterElementModel.create
    label: "Numer JRB"
  buildingNumber: App.StandardFilterElementModel.create
    label: "Numer budynku"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer posesji"
  buildingSignature: App.StandardFilterElementModel.create
    label: "Dokument budynku"
  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false

