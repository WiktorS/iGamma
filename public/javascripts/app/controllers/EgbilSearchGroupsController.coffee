App.EgbilSearchGroupsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getGroupByNip"
  columns: [
    "check"
    "marker"
    "groupName"
    "address"
    "regon"
    "nip"
  ]
  type: "groups"
  title: "Podmioty grupowe"
