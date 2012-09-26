App.ModelTableView = Em.View.extend
  tagName: "table"
  classNames: ["table", "table-striped"]
  templateName: "modelTable"

  content: null
  columns: null
