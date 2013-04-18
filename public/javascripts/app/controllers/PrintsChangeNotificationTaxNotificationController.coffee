App.ChangeNotificationTaxNotificationController = Em.Controller.extend
  #input params
  content: null

  #general tab logic
  printChangesNotChecked: (-> !@get("content.printChanges")).property("content.printChanges")
  shareInfoNotChecked: (-> @get("printChangesNotChecked") || !@get("content.shareInfo")).property("content.shareInfo", "printChangesNotChecked")
  shareTypeChangesNotChecked: (-> @get("shareInfoNotChecked") || @get("content.shareType") != "changes").property("content.shareType", "shareInfoNotChecked")

  chosenColumns: (-> App.Columns.getColumns ["g5"]).property()
