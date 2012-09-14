App.EgbilSearchCommonView = Em.View.extend
  formFields: Em.A()
  pushFormField: (field) ->
    @formFields.pushObject field
