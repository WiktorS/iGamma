App.EgbilSearchJrgView = Em.View.extend
  templateName: "egbilSearchJrg"

  formFields: Em.A()
  pushFormField: (field) ->
    @formFields.pushObject field