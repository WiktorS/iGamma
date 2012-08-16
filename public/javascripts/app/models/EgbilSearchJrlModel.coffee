App.EgbilSearchJrlModel = Em.Object.extend
  jrlNumber: App.StandardFilterElementModel.create
    label: "Numer JRL"
  localNumber: App.StandardFilterElementModel.create
    label: "Numer ewidencyjny lokalu"
    help: "[%]"
  town: App.StandardFilterElementModel.create
    label: "Miejscowość"
    help: "[%]"
  street: App.StandardFilterElementModel.create
    label: "Ulica"
    help: "[%]"
  houseNumber: App.StandardFilterElementModel.create
    label: "Numer porządkowy"
    help: "[%]"
  localSignature: App.StandardFilterElementModel.create
    label: "Dokument lokalu"
    help: "[%]"
  historicalEntries: App.StandardFilterElementModel.create
    label: "Uwzględnij wpisy historyczne"
    value: false

