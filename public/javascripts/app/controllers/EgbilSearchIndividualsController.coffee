App.EgbilSearchIndividualsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getPersonByPesel"
  columns: [
    "check"
    "marker"
    "surnameAndNames"
    "address"
    "pesel"
    "identityDoc"
  ]
  type: "individuals"
  title: "Osoby fizyczne"