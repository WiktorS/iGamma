App.EgbilListController = Em.ArrayController.extend
  content: null
  type: null

  columns: (-> 
    type = @get "type"
    columnsOrder = @get "columnsOrder.#{type}"
    Em.assert "Column order in #{@get("constructor").toString()} is not defined for type '#{type}'", columnsOrder
    App.get("columnsData").getColumns(columnsOrder)
    ).property("type")
  columnsOrder:
    building: [ "check","show","marker","building","lots","precinct","cadastralUnit","jrg","jrb","buildingKind","constructionFinishDate","buildingArea" ]
    document: [ "check","marker","document","documentKind","documentScan","documentLots","documentBuildings","documentLocals","documentChanges" ]
    group: [ "check","show","marker","group","address","regon","nip" ]
    person: [ "check","show","marker","person","address","pesel","identityDocument" ]
    institution: [ "check","show","marker","institution","address","regon","nip" ]
    jrg: [ "check","show","marker","jrg","jrb","precinct","cadastralUnit","creationProof","creationDate","regon" ]
    jrb: [ "check","show","marker","jrb","precinct","cadastralUnit","creationProof","creationDate" ]
    jrl: [ "check","show","marker","jrl","precinct","cadastralUnit","creationProof","creationDate" ]
    oldJrg: [ "check","show","marker","jrg","precinct","cadastralUnit","creationProof","creationDate" ]
    landCommunity: [ "check","show","marker","landCommunity","address" ]
    local: [ "check","show","marker","local","address","documents","precinct","cadastralUnit","jrg","jrl","usableArea","lot","building" ]
    lot: [ "check","show","marker","lot","precinct","cadastralUnit","jrg","addresses","documents","cadastralArea" ]
    #change: [ "check", "change", "changeYear", "applicationYear", "changeKind", "changeStatus", "changeDescription" ]

  title: (->
    type = @get "type"
    @get "titleData.#{type}"
    ).property("type")
  titleData:
    building: "Budynki"
    document: "Dokumenty"
    group: "Podmioty grupowe"
    person: "Osoby fizyczne"
    institution: "Instytucje"
    jrg: "Jednostki Rejestrowe Gruntów i Budynków"
    jrb: "Jednostki Rejestrowe Budynków"
    jrl: "Jednostki Rejestrowe Lokali"
    oldJrg: "Stare Jednostki Rejestrowe Gruntów"
    landCommunity: "Zarządy wspólnot gruntowych"
    local: "Lokale"
    lot: "Działki"

  fetchDataCallback: (fetchQueue, type) -> 
    @get("target.egbilController").fetchDataCallback(fetchQueue, type)

  checkedList: (->
    @get("content").filterProperty "check"
    ).property("content.@each.check")
  isAnyChecked: (->
    !Em.empty @get("checkedList")
    ).property("checkedList")
  isMultipleChecked: (->
    @get("checkedList").length > 1
    ).property("checkedList")
  canShowRightPanel: (->
    type = @get "type"
    Em.A(@get "target.egbilController.rightPanelData.#{type}").length > 0
    ).property("type")
  rightPanelContent: (->
    type = @get "type"
    data = @get "target.egbilController.rightPanelData.#{type}"
    if @get("isAnyChecked") && @get("canShowRightPanel")
      if @get "isMultipleChecked"
        data.filterProperty "multiselect", true
      else
        data
    ).property("type", "isAnyChecked", "isMultipleChecked")
  objectNameColumn: (->
    type = @get "type"
    checked = @get "checkedList.0"
    for own key of checked
      value = checked.get key
      if value instanceof App.StandardTableCellModel
        if value.get("valueType") == type && value.get("value")?
          return key
    ).property("type", "checkedList.0")
  rightPanelSelectedObjects: (->
    type = @get "type"
    objectNameColumn = @get "objectNameColumn"
    Em.assert "List doesn't contain column of type: #{type}", objectNameColumn
    listMappingFunc = (x) ->
      @create
        objectName: x.get "#{objectNameColumn}.value"
        objectType: type
    @get("checkedList").map listMappingFunc, Em.Object
    ).property("type", "checkedList", "objectNameColumn")

  openList: (objectList)->
    type = objectList.get "0.objectType"
    jsonMethod = @get "target.egbilSearchController.searchMethodData.#{type}"
    Em.assert "SearchMethod undefinned for type: #{type}", jsonMethod
    $.ajax
      url: "#{jsonMethod}.json"
      data:
        objectList: objectList
      success: (data) =>
        if !Em.empty data && Em.isArray data
          objectModel = @get "target.egbilController.objectModel.#{type}"
          Em.assert "Could not find model for object '#{type}'", objectModel
          @set "target.egbilListController.type", type
          @set "target.egbilListController.content", data.map(App.Common.toModel, objectModel)
          @get("target").send "goToList"
        else
          alert "Nie znaleziono rekordu"  #TODO: Error handling
