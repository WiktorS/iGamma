App.PrintExtractsModalView = App.ModalView.extend
  templateName: "printExtractsModal"

  content: null
  contentParams: (-> @get("content")?.toParam()).property("content")
  printForm: null
  action: "print/extracts"

  didInsertElement: ->
    @_super()
    @set "printForm", @$("form")
