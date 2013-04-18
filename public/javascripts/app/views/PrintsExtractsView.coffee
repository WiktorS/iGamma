App.ExtractsView = Em.View.extend
  templateName: "extracts"

  didInsertElement: ->
    content = @get "controller.content"
    #TODO: dummy fill
    content.set "shares", [ App.EgbilObjectShareModel.create().setProperties({id: 1}) ]
    content.set "lots", [ App.EgbilObjectLotModel.create().setProperties({id: 1}) ]
    content.set "locals", [ App.EgbilObjectLocalModel.create().setProperties({id: 1}) ]
    content.set "buildings", [ App.EgbilObjectBuildingModel.create().setProperties({id: 1}) ]
