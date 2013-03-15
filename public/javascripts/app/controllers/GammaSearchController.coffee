App.GammaSearchController = Em.Controller.extend
  needs: ["gamma"]

  type: null

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
    change: "Zmiany"

  findObjects: (searchArgs) ->
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
          objectModel = @get "controllers.gamma.objectModel.#{type}"
          Em.assert "Model for object '#{type}' not defined in GammaController", objectModel
          list = data.map(((x)-> 
            @create().setProperties
              _objectId: x
              _objectType: type
            ), objectModel)
          Em.run.sync()
          @get("target").send "goToList", Em.Object.create
            type: type
            list: list
        else
          alert "Brak wyników" #TODO: error handling
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
