App.PrintCustomReportModalView = App.ModalView.extend
  templateName: "printCustomReportModal"

  content: null
  contentParams: (-> @get("content")?.toParam()).property("content")
  printForm: null
  action: "print/customReport"

  didInsertElement: ->
    @_super()
    @set "printForm", @$("form")
