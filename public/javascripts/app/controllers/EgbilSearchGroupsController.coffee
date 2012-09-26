App.EgbilSearchGroupsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getGroupByNip"
  title: "Podmioty grupowe"
  columns: [
    "check"
    "show"
    "marker"
    "name"
    "address"
    "regon"
    "nip"
  ]
