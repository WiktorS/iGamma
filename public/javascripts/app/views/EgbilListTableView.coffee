App.EgbilListTableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]
  templateName: "egbilListTable"

  content: null
  columns: null

  init: ->
    @_super()
    content = Em.A()
    columns = Em.A()
