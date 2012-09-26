App.EgbilSearchDocumentsController = App.EgbilSearchCommonController.extend
  jsonMethod: "getDocuments"
  columns: [
    "check"
    "marker"
    "sygnature"
    "type"
    "scan"
    "lots"
    "buildings"
    "locals"
    "changes"
  ]
  title: "Dokumenty"
