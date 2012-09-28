App.FilterSystematicsView = Em.View.extend
  templateName: "filterSystematics"
  classNames: ["row"]
  systematicsModal: null

  init: ->
    @_super()
    @set "systematicsModal", App.SystematicsModalView.create()
    #appendTo rootElement fixes event handling on modal, but messes up 'backdrop' dim
    @get("systematicsModal").appendTo(App.get('rootElement')) #TODO: fix 'backdrop'

  didInsertElement: ->
    @_super()
    @get("parentView").pushFormField? @get "field"

  willDestroyElement: ->
    @_super()
    @get("systematicsView").$(".modal")?.modal("hide")

  chooseSystematics: (e) ->
    @set "systematicsModal.selectedSystematic", Em.makeArray(@get("field.value")?.split("."))
    @get("systematicsModal").$(".modal").modal
      backdrop: false

  _selectedSystematicChanged: (->
    @set "field.value", Em.makeArray(@get("systematicsModal.selectedSystematic")).join(".")
  ).observes("systematicsModal.selectedSystematic")
