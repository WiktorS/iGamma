App.EgbilController = Em.Controller.extend
  objects: Em.A()

  appendObject: (object) ->
    @objects.pushObject(object)
