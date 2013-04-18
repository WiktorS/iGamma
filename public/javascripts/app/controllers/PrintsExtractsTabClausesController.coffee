App.ExtractsTabClausesController = Em.Controller.extend
  # input
  content: null

  columns: (-> App.Columns.getColumns ["check", "clauseEdit", "clauseText"]).property()

  editObject: null
  editText: null

  edit: (value) ->
    @set "editObject", value
    @set "editText", value.get "clauseText"
    for item in @get "content"
      item.set("inEdit", false) if item != value

  reset: (value) ->
    value.set "clauseText", value.get "clauseDefaultText"

  cancel: (value) ->
    @set "editObject", null
    @set "editText", null

  save: (value) ->
    @set "editObject.clauseText", @get "editText"
    @set "editObject", null
    @set "editText", null
