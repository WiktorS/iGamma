App.TabItemView = Em.View.extend
  defaultTemplate: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  classNameBindings: ["active"]
  displayName: null
  stateName: null
  currentStatePathBinding: "controller.target.currentState.path"
  click: (e) -> App.router.transitionTo this.get("stateName")
  active: ( ->
    @get("currentStatePath").match("\\." + @get("stateName")+"(\\.|$)") != null
  ).property("currentStatePath", "stateName")


App.ObjectTabItemView = App.TabItemView.extend
  object: null
  templateName: "objectTabItem"
  stateName: (-> @get "object._objectType").property("object._objectType")
  displayName: (-> @get "object._objectName").property("object._objectName")
  currentStateObjectNameBinding: "controller.target.currentState.objectName"
  click: (e) ->
    App.router.send "showObject", @get("object")
  active: ( ->
    #TODO: match objectId not objectName
    @get("currentStatePath").match("\\." + @get("stateName")+"(\\.|$)") != null &&
      @get("currentStateObjectName") == @get("displayName")
  ).property("currentStatePath", "currentStateObjectName", "stateName", "displayName")
