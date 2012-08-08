App.EgbilSearchJrgibModel = Em.Object.extend
  jrgNumber: App.StandardFilterElementModel.create
    label: "Numer JRG"
  jrbNumber: App.StandardFilterElementModel.create
    label: "Numer JRB"
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
  buildingNumber: App.StandardFilterElementModel.create
    label: "Numer budynku"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer posesji"
  lotSignature: App.StandardFilterElementModel.create
    label: "Dokument działki"
  buildingSignature: App.StandardFilterElementModel.create
    label: "Dokument budynku"
  localSignature: App.StandardFilterElementModel.create
    label: "Dokument lokalu"
  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false

