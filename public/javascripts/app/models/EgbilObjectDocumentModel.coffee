App.EgbilObjectDocumentModel = App.EgbilObjectModel.extend
  _objectType: "document"
  _objectName: (-> "#{@get "documentKind"} - #{@get "documentName"}").property("documentKind", "documentName")
  _objectDescription: (-> "#{@get "_objectName"}").property("_objectName")
  _internalMaps: (->
    {
      lots: App.EgbilObjectLotModel
      buildings: App.EgbilObjectBuildingModel
      locals: App.EgbilObjectLocalModel
      changes: App.EgbilObjectChangeModel
    }
    ).property()

  documentIDBinding: "id"
  documentName: null
  documentKind: null
  documentSource: null
  creationDate: null
  receiptDate: null
  description: null
  designation: null
  relatedDocumentID: null
  relatedDocumentName: null
  relatedDocumentKind: null
  scan: null
  lots: null
  buildings: null
  locals: null
  changes: null
