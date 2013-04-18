App.PrecinctModel = App.GammaObjectModel.extend
  _objectType: "precinct"
  _objectDescription: (-> "#{@get "name"} - #{@get "desc"}").property("name", "desc")

  check: null  
  name: null
  desc: null
