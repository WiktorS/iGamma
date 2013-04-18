App.CadastralUnitModel = App.GammaObjectModel.extend
  _objectType: "cadastralUnit"
  _objectDescription: (-> "#{@get "name"} - #{@get "desc"}").property("name", "desc")
  _internalMaps: (->
    {
      precincts: App.PrecinctModel
    }
    ).property()

  name: null
  desc: null
  precincts: null

