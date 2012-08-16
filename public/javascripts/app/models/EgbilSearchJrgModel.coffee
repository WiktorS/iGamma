App.EgbilSearchJrgModel = Em.Object.extend
  jrgNumber: App.StandardFilterElementModel.create
    label: "Numer JRG"
  lotNumber: App.StandardFilterElementModel.create
    label: "Numer działki"
    help: "[%][,]"
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
  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false

