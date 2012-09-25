App.EgbilSearchIndividualsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getPersonByPesel"
  title: "Osoby fizyczne"
  columns: [
    "check"
    "show"
    "marker"
    "surnameAndNames"
    "address"
    "pesel"
    "identityDoc"
  ]
