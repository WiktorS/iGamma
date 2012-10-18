App.EgbilSearchGroupController = App.EgbilSearchCommonController.extend
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
  type: "group"
  title: "Podmioty grupowe"
