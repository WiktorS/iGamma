App.EgbilSearchController = Em.Controller.extend
  type: (->
    @get "target.currentState.name"
    ).property("target.currentState.name")

  queryName: (->
    type = @get "type"
    @get "queryNameData.#{type}"
    ).property("type")
  queryNameData:
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

  doSearch: (searchArgs) ->
    $.ajax
      type: "POST"
      url: "findObjects.json"
      data:
        queryName: @get "queryName"
        queryArgs: searchArgs
      success: (data) =>
        # data is array of ids
        if Em.isArray data
          type = @get "type"
          objectModel = @get "target.egbilController.objectModel.#{type}"
          Em.assert "Model for object '#{type}' not defined in EgbilController", objectModel
          list = data.map(((x)-> 
            @create().setProperties
              _objectId: x
              _objectType: type
            ), objectModel)
          Em.run.sync()
          @set "target.egbilListController.type", type
          @set "target.egbilListController.content", list
          @get("target").send "goToList"
        else
          alert "Brak wyników" #TODO: error handling
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
