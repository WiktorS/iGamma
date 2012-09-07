App.EgbilSearchJrbView = Em.View.extend
  templateName: "egbilSearchJrb"

  formFields: Em.A()
  pushFormField: (field) ->
    @formFields.pushObject field
