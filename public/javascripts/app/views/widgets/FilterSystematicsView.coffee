App.FilterSystematicsView = Em.View.extend
  templateName: "filterSystematics"
  classNames: ["row"]

  clearField: (event) ->
    @set "field.value", ""
    @set "field.alternateValue", ""

  didInsertElement: ->
    @_super()
    @get("parentView").pushFormField? @get "field"

  chooseSystematics: (e) ->
    systematicsModal = App.SystematicsModalView.modal()
    systematicsModal.set "selectedSystematic", Em.A(@get("field.value")?.split("."))
    systematicsModal.addObserver "selectedSystematic", this, ->
      @set "field.value", Em.makeArray(systematicsModal.get "selectedSystematic").join(".")
