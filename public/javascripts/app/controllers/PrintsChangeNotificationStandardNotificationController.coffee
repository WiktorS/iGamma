App.ChangeNotificationStandardNotificationController = Em.Controller.extend
  #input params
  content: null

  #general tab logic
  printChangesNotChecked: (-> !@get("content.printChanges")).property("content.printChanges")
  shareInfoNotChecked: (-> @get("printChangesNotChecked") || !@get("content.shareInfo")).property("content.shareInfo", "printChangesNotChecked")
  shareTypeChangesNotChecked: (-> @get("shareInfoNotChecked") || @get("content.shareType") != "changes").property("content.shareType", "shareInfoNotChecked")
  buildingIndexNotChecked: (-> !@get("content.buildingIndex")).property("content.buildingIndex")
  localIndexNotChecked: (-> @get("buildingIndexNotChecked") || !@get("content.localIndex")).property("content.localIndex", "buildingIndexNotChecked")

  chosenColumns: (-> App.Columns.getColumns ["g5"]).property()
