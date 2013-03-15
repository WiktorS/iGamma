App.FilterSystematicView = Em.View.extend
  templateName: "filterSystematic"
  classNames: ["row"]
  cache: null

  clearField: ->
    @set "field.value", ""
    @set "field.alternateValue", ""

  didInsertElement: ->
    @_super()
    @get("controller").appendSearchField? @get("field"), @get("attrIndex")

  chooseSystematic: ->
    systematicModal = App.SystematicModalView.modal()
    systematicModal.set "cache", @get "cache"
    systematicModal.set "selectedSystematic", Em.A(@get("field.value")?.split("."))
    systematicModal.addObserver "selectedSystematic", this, ->
      @set "field.value", Em.makeArray(systematicModal.get "selectedSystematic").join(".")
