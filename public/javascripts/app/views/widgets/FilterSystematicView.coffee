App.FilterSystematicView = Em.View.extend
  templateName: "filterSystematic"
  classNames: ["row"]

  clearField: (event) ->
    @set "field.value", ""
    @set "field.alternateValue", ""

  didInsertElement: ->
    @_super()
    @get("parentView").pushFormField? @get("field"), @get("attrIndex")

  chooseSystematic: (e) ->
    systematicModal = App.SystematicModalView.modal()
    systematicModal.set "selectedSystematic", Em.A(@get("field.value")?.split("."))
    systematicModal.addObserver "selectedSystematic", this, ->
      @set "field.value", Em.makeArray(systematicModal.get "selectedSystematic").join(".")
