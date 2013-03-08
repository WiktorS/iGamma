App.GammaSearchView = Em.View.extend
  formFields: Em.A()

  
  pushFormField: (field, attrIndex) ->
    Em.assert "Field on a form must have not null definition", field
    field.set "attrIndex", attrIndex
    @get("formFields").pushObject field

  getSearchArgs: ->
    result = {}
    for field in @get "formFields"
      name = field.get "name"
      value = field.get "value"
      attrIndex = field.get "attrIndex"
      if !Em.empty(name) && !Em.empty(value) && attrIndex?
        result[attrIndex] = { name: name, value: value }
    result
