App.EgbilSearchCommonView = Em.View.extend
  formFields: Em.A()

  
  pushFormField: (field) ->
    @get("formFields").pushObject field

  getSearchArgs: ->
    result = {}
    for field in @get "formFields"
      name = field.get "name"
      value = field.get "value"
      if !Em.empty(name) && !Em.empty(value)
        result[name] = value
    result
