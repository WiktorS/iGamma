App.EgbilSearchInstitutionController = App.EgbilSearchCommonController.extend
  jsonMethod: "getInstitutionByNip"
  columns: [
    "check"
    "show"
    "marker"
    "name"
    "address"
    "regon"
    "nip"
  ]
  type: "institution"
  title: "Instytucje"
