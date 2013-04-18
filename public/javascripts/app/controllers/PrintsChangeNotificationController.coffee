App.ChangeNotificationController = Em.Controller.extend
  #input params
  content: null

  changeChooserText: (->
    chosenChange = @get "chosenChange"
    chosenChange ? "Wybierz zmiane >>"
    ).property("chosenChange")
  chosenChange: null

  registerUnitListBinding: "content.changeRegisterUnits"

  registerUnitColumns: (-> App.Columns.getColumns ["check", "registerUnit", "precinct", "cadastralUnit"]).property()
