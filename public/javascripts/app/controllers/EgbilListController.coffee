App.EgbilListController = Em.ArrayController.extend
  content: null
  type: null

  columns: (->
    type = @get "type"
    @get "columnsData.#{type}"
    ).property("type")
  columnsData:
    building: [ "check","show","marker","buildingNumber","lotNumber","precinct","cadastralUnit","jrgNumber","jrbNumber","type","finishYear","buildUpArea" ]
    document: [ "check","marker","sygnature","type","scan","lots","buildings","locals","changes" ]
    group: [ "check","show","marker","name","address","regon","nip" ]
    individual: [ "check","show","marker","surnameAndNames","address","pesel","identityDoc" ]
    institution: [ "check","show","marker","name","address","regon","nip" ]
    jrb: [ "check","show","marker","jrbNumber","precinct","cadastralUnit","creationProof","creationDate" ]
    jrg: [ "check","show","marker","jrgNumber","precinct","cadastralUnit","creationProof","creationDate" ]
    jrgib: [ "check","show","marker","jrgNumberJrgib","jrbNumberJrgib","precinct","cadastralUnit","creationProof","creationDate","regon" ]
    jrl: [ "check","show","marker","jrlNumber","precinct","cadastralUnit","creationProof","creationDate" ]
    landCommunity: [ "check","show","marker","name","address" ]
    local:[ "check","show","marker","localNumber","address","document","precinct","cadastralUnit","jrgNumber","jrlNumber","usableArea","lotNumber","buildingNumber" ]
    lot: [ "check","show","marker","lotNumber","precinct","cadastralSheet","cadastralUnit","jrgNumber","address","document","cadastralArea" ]

  title: (->
    type = @get "type"
    @get "titleData.#{type}"
    ).property("type")
  titleData:
    building: "Budynki"
    document: "Dokumenty"
    group: "Podmioty grupowe"
    individual: "Osoby fizyczne"
    institution: "Instytucje"
    jrb: "Jednostki Rejestrowe Budynków"
    jrg: "Stare Jednostki Rejestrowe Gruntów"
    jrgib: "Jednostki Rejestrowe Gruntów i Budynków"
    jrl: "Jednostki Rejestrowe Lokali"
    landCommunity: "Zarządy wspólnot gruntowych"
    local: "Lokale"
    lot: "Działki"

  checkedList: (->
    @get("content").filterProperty "isChecked"
    ).property("content.@each.isChecked")
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