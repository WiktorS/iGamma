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

  notificationType: null

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView
  #values determined with current route
  _routeChanged: (->
    if @get("inChangeNotificationRoute")
      router = @get("router")
      @set "notificationType",
        if router.isActive "changeNotification.standardNotification" then "standard"
        else if router.isActive "changeNotification.taxNotification" then "taxNotification"
        else if router.isActive "changeNotification.taxClassification" then "taxClassification"
    ).observes("router.url")
  inChangeNotificationRoute: (-> @get("router").isActive "changeNotification").property("router.url")

  isStandardNotification: (-> "standard" == @get "notificationType").property("notificationType")

  #general tab logic
  printChangesNotChecked: (-> !@get("content.printChanges")).property("content.printChanges")
  shareInfoNotChecked: (-> @get("printChangesNotChecked") || !@get("content.shareInfo")).property("content.shareInfo", "printChangesNotChecked")
  shareTypeChangesNotChecked: (-> @get("shareInfoNotChecked") || @get("content.shareType") != "changes").property("content.shareType", "shareInfoNotChecked")
  buildingIndexNotChecked: (-> !@get("content.buildingIndex")).property("content.buildingIndex")
  localIndexNotChecked: (-> @get("buildingIndexNotChecked") || !@get("content.localIndex")).property("content.localIndex", "buildingIndexNotChecked")

  chosenColumns: (-> App.Columns.getColumns ["g5"]).property()
