App.EgbilObjectModel = Em.Object.extend
  _dataStatus: null
  _objectIdBinding: "id"
  _objectType: null
  _objectName: null
  id: null

  init: ->
    @_super()
    @set "_dataStatus", App.EgbilObjectStatus.IDLE

#Model status
App.EgbilObjectStatus =
  IDLE: 1
  LOADING: 2
  READY: 3
  ERROR: 4
