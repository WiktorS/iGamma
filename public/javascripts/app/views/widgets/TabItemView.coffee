App.TabItemView = Em.View.extend
  defaultTemplate: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  classNameBindings: ["active"]
  displayName: null
  stateName: null
  currentStatePathBinding: "App.router.currentState.path"
  click: (e) -> App.router.transitionTo this.get("stateName")
  active: ( ->
    @get("currentStatePath").match("\\." + @get("stateName")+"(\\.|$)") != null
  ).property("currentStatePath", "stateName")


App.ObjectTabItemView = App.TabItemView.extend
  templateName: "objectTabItem"
  objectName: null
  objectType: null
  stateNameBinding: "objectType"
  displayNameBinding: "objectName"
  currentStateObjectNameBinding: "App.router.currentState.objectName"
  click: (e) ->
    App.router.send "showObject", App.EgbilObjectInfo.create
      name: @get "objectName"
      type: @get "objectType"
  active: ( ->
    @get("currentStatePath").match("\\." + @get("stateName")+"(\\.|$)") != null &&
      @get("currentStateObjectName") == @get("objectName")
  ).property("currentStatePath", "currentStateObjectName", "stateName")
  close: (e) ->
    e.stopPropagation()
    this.$().hide "fast", =>
      App.router.send "closeObject", App.EgbilObjectInfo.create
        name: @get "objectName"
        type: @get "objectType"
