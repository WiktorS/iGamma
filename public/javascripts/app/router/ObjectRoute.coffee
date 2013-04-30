#TODO: Rewrite - data is not fetch in right way and sometimes we can get double transitions!
RouteWithObjectParam = App.Route.extend
  objectId: null
  objectType: (-> @get("routeName").split(".")[1]).property("routeName") #TODO: Maybe this can be done better
  objectName: null
  objectOutletName: null
  model: (params)->
    #have to use setProporties because some of set proporties are computed proporties
    object = App.GammaObjectModel.create().setProperties
      _objectId: parseInt(params.id)
      _objectType: @get "objectType"
      _objectName: params.name
    Em.run.sync()
    object
  serialize: (model, params) ->
    result =
      id: model.get "_objectId"
      name: model.get "_objectName"
  renderTemplate: (controller, model)->
    Em.assert "Object type doesn't match state type", @get("objectType") == model.get("_objectType")
    @set "objectId", model.get "_objectId"
    @set "objectName", model.get "_objectName"
    object = @controllerFor("gamma").getObject @get("objectId"), @get("objectType")
    if !Em.isEmpty object
      @controllerFor("gammaObject").set "content", object
      @controllerFor(@get("objectOutletName")).set "content", object
      # @controllerFor(@get("routeName")).set "content", object
      @render @get("objectOutletName")
    else
      @controllerFor("gamma").openObject model.get("_objectId"), model.get("_objectType")

App.EgbilObjectJrgRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrg"
App.EgbilObjectJrbRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrb"
App.EgbilObjectJrlRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectJrl"
App.EgbilObjectOldJrgRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectOldJrg"
App.EgbilObjectDocumentRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectDocument"
App.EgbilObjectLotRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLot"
App.EgbilObjectBuildingRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectBuilding"
App.EgbilObjectLocalRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLocal"
App.EgbilObjectPersonRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectPerson"
App.EgbilObjectInstitutionRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectInstitution"
App.EgbilObjectGroupRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectGroup"
App.EgbilObjectLandCommunityRoute = RouteWithObjectParam.extend
  objectOutletName: "egbilObjectLandCommunity"
App.ChangesObjectChangeRoute = RouteWithObjectParam.extend
  objectOutletName: "changesObjectChange"
