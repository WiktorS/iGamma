App.GammaObjectModel = Em.Object.extend
  _dataStatus: null
  _objectIdBinding: "id"
  _objectType: null
  _objectName: null
  id: null

  #since its impossible to identify two resources of the same name in the router, we have to provide route getter
  _objectRoute: (->
    objectType = @get "_objectType"
    routeData = Em.Object.create
      building: "egbilObject.building"
      document: "egbilObject.document"
      group: "egbilObject.group"
      person: "egbilObject.person"
      institution: "egbilObject.institution"
      jrg: "egbilObject.jrg"
      jrb: "egbilObject.jrb"
      jrl: "egbilObject.jrl"
      oldJrg: "egbilObject.oldJrg"
      landCommunity: "egbilObject.landCommunity"
      local: "egbilObject.local"
      lot: "egbilObject.lot"
      address: "egbilObject.address"
      share: "egbilObject.share"
      change: "changesObject.change"
    routeData.get objectType
    ).property("_objectType")

  init: ->
    @_super()
    @set "_dataStatus", App.GammaObjectStatus.IDLE
