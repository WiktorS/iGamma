App.EgbilSearchDocumentController = App.EgbilSearchCommonController.extend
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
  type: "document"
  title: "Dokumenty"
