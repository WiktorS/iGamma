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

  findObjects: (options) ->
    getContentValues = (model) ->
      result = {}
      for own property, item of model
        if item instanceof App.StandardFilterElementModel
          name = item.get "name"
          value = item.get "value"
          attrIndex = item.get "attrIndex"
          if !Em.isEmpty(name) && !Em.isEmpty(value) && !Em.isEmpty(attrIndex)
            result[attrIndex] = { name: name, value: value }
        else if typeof item == "object"
          $.extend(result, getContentValues(item))
      return result
    searchArgs = getContentValues(options.content)
    #TODO: Check if searchArgs is not empty
    App.Common.ajax
      type: "POST"
      url: "api/findObjects.json"
      data:
        queryName: @get "queryName"
        queryArgs: searchArgs
      success: (data) =>
        # data is array of ids
        if Em.isArray data
          type = options.type
          objectModel = @get "controllers.gamma.objectModel.#{type}"
          Em.assert "Model for object '#{type}' not defined in GammaController", objectModel
          list = data.map(((x)->
            @create().setProperties
              _objectId: x
              _objectType: type
            ), objectModel)
          Em.run.sync()
          options.success?.call(@, list)
        else
          alert "Brak wyników" #TODO: error handling
      error: (jqXHR, textStatus, errorThrown) ->
        alert errorThrown #TODO: error handling
