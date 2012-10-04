App.EgbilSearchGroupsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getGroupByNip"
  columns: [
    "check"
    "show"
    "marker"
    "name"
    "address"
    "regon"
    "nip"
  ]
  type: "groups"
  title: "Podmioty grupowe"
