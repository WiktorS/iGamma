App.EgbilSearchIndividualsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getPersonByPesel"
  columns: [
    "check"
    "show"
    "marker"
    "surnameAndNames"
    "address"
    "pesel"
    "identityDoc"
  ]
  type: "individuals"
  title: "Osoby fizyczne"