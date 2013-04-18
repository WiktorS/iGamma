App.PrintClauseModel = App.GammaObjectModel.extend
  _objectType: "clause"
  _objectName: null

  check: null
  clauseText: null
  clauseDefaultText: null
  clauseCheckedBinding: "check"


  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY
