App.Common =
  toModel: (x) ->
    output = @create()
    for key,value of x
      output.set key, value
    for own key, modelClass of output.get "_internalMaps"
      Em.assert "Member '#{key}' of class #{@.toString()} has undefined model class", modelClass
      Em.assert "Member '#{key}' is undefined for #{@.toString()}", "undefined" != typeof output.get(key)
      list = output.get(key)
      output.set key, list?.map(App.Common.toModel, modelClass)
    output
