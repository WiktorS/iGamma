App.EgbilSearchInstitutionsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getInstitutionByNip"
  columns: [
    "check"
    "marker"
    "name"
    "address"
    "regon"
    "nip"
  ]
  type: "institutions"
  title: "Instytucje"
