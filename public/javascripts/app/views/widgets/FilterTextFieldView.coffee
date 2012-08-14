App.FilterTextFieldView = Em.View.extend
  templateName: "filterTextField"
  tagName: "span"
  asTextField: true
  clearField: (event) ->
    @element.set "value", ""
