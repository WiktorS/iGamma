App.PrintChangeNotificationModalView = App.ModalView.extend
  templateName: "printChangeNotificationModal"

  content: null
  contentParams: (-> @get("content")?.toParam()).property("content")
  printForm: null
  action: "print/changeNotification"

  didInsertElement: ->
    @_super()
    @set "printForm", @$("form")
