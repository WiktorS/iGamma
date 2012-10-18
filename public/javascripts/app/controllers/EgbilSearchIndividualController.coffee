App.EgbilSearchIndividualController = App.EgbilSearchCommonController.extend
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
  type: "individual"
  title: "Osoby fizyczne"