App.TabItemView = Em.View.extend
  template: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  displayName: null
  click: (e) -> App.router.transitionTo this.get("stateName")
  classNameBindings: ["active"]
  stateName: null
  currentStateNameBinding: "App.router.currentState.path"
  active: ( ->
    @get("currentStateName").match("\\." + @get("stateName")+"(\\.|$)") != null
  ).property("currentStateName", "stateName")


App.ObjectTabItemView = App.TabItemView.extend
  objectName: null
  currentStateObjectNameBinding: "App.router.currentState.objectName"

  click: (e) ->
    App.router.send "goToObject", Ember.Object.create {objectName: @get("objectName").valueOf()}
  active: ( ->
    @get("currentStateName").match("\\." + @get("stateName")+"(\\.|$)") != null &&
      @get("currentStateObjectName").valueOf() == @get("objectName").valueOf()
  ).property("currentStateName", "currentStateObjectName", "stateName")
