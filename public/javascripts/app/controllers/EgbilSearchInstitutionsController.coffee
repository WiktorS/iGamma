App.EgbilSearchInstitutionsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getInstitutionByNip"
  title: "Instytucje"
  columns: [
    "check"
    "show"
    "marker"
    "name"
    "address"
    "regon"
    "nip"
  ]
