App.ModelTableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]
  templateName: "modelTable"

  content: null
  columns: null

  init: ->
    @_super()
    content = Em.A()
    columns = Em.A()
