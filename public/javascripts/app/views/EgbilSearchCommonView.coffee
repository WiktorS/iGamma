App.EgbilSearchCommonView = Em.View.extend
  formFields: Em.A()

  
  pushFormField: (field, attrIndex = null) ->
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
