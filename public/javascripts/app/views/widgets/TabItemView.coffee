App.TabItemView = Em.View.extend
  defaultTemplate: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  classNameBindings: ["active"]
  displayName: null
  stateName: null
  currentStateNameBinding: "App.router.currentState.path"
  click: (e) -> App.router.transitionTo this.get("stateName")
  active: ( ->
    @get("currentStateName").match("\\." + @get("stateName")+"(\\.|$)") != null
  ).property("currentStateName", "stateName")


App.ObjectTabItemView = App.TabItemView.extend
  templateName: "objectTabItem"
  objectName: null
  currentStateObjectNameBinding: "App.router.currentState.objectName"
  click: (e) ->
    App.router.egbilController.showObject @get("objectName").valueOf()
  active: ( ->
    @get("currentStateName").match("\\." + @get("stateName")+"(\\.|$)") != null &&
      @get("currentStateObjectName").valueOf() == @get("objectName").valueOf()
  ).property("currentStateName", "currentStateObjectName", "stateName")
  close: (e) ->
    e.stopPropagation()
    this.$().hide "fast", =>
      App.router.egbilController.closeObject @get("objectName").valueOf()
