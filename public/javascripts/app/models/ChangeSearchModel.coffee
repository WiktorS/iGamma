App.ChangeSearchModel = Em.Object.extend
  systematics: App.StandardFilterElementModel.create
    label: "Systematyka"
    name: "systematics"

  change:
    year: App.StandardFilterElementModel.create
      label: "Rok zmiany"
      help: "[%]"
      name: "changeYear"
    number: App.StandardFilterElementModel.create
      label: "Numer zmiany"
      help: "[%]"
      name: "changeNumber"
    applicationYear: App.StandardFilterElementModel.create
      label: "Rok zgłoszenia"
      help: "[%]"
      name: "changeApplicationYear"
    applicationNumber: App.StandardFilterElementModel.create
      label: "Numer kancelaryjny"
      help: "[%]"
      name: "changeApplicationNumber"
    kind: App.StandardFilterElementModel.create
      label: "Rodzaj zmiany"
      name: "changeKind"
    stockKerg: App.StandardFilterElementModel.create
      label: "KERG"
      name: "changeStockKerg"
    status: App.StandardFilterElementModel.create
      label: "Status zmiany"
      name: "changeStatus"
    description: App.StandardFilterElementModel.create
      label: "Opis zmiany"
      help: "[%]"
      name: "changeDescription"

  document:
    type: App.StandardFilterElementModel.create
      label: "Rodzaj"
      name: "documentKind"
    signature: App.StandardFilterElementModel.create
      label: "Sygnatura"
      help: "[%]"
      name: "documentSignature"
    source: App.StandardFilterElementModel.create
      label: "Źródło"
      help: "[%]"
      name: "documentSource"
    creationFromDate: App.StandardFilterElementModel.create
      label: "Data utworzenia od"
      type: "calendar"
      name: "documentCreationDateFrom"
    creationToDate: App.StandardFilterElementModel.create
      label: "Data utworzenia do"
      type: "calendar"
      name: "documentCreationDateTo"
    receiptFromDate: App.StandardFilterElementModel.create
      label: "Data wpływu od"
      type: "calendar"
      name: "documentReceiptDateFrom"
    receiptToDate: App.StandardFilterElementModel.create
      label: "Data wpływu do"
      type: "calendar"
      name: "documentReceiptDateTo"
    description: App.StandardFilterElementModel.create
      label: "Opis"
      help: "[%]"
      name: "documentDescription"

  lot:
    systematics: App.StandardFilterElementModel.create
      label: "Systematyka"
      name: "systematics"
    number: App.StandardFilterElementModel.create
      label: "Numer działki"
      help: "[%][,]"
      name: "lotNumber"
