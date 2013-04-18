App.ChangeNotificationTabFrontPageController = Em.Controller.extend
  #input params
  content: null

  personColumns: (-> App.Columns.getColumns ["entity"]).property()
  personList: (-> []).property()  #TODO
  selectedPersonList: null

  registerUnitList: (-> @get("content.chosenRegisterUnits").filterProperty("check")).property()
  selectedRegisterUnit: null

