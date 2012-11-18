App.ShareSummaryModel = Em.Object.extend
  group: null
  share: null

  init: ->
    @_super()
    @group = App.StandardTableCellModel.create
      label: "Grupa"
    @share = App.StandardTableCellModel.create
      label: "Udział"
