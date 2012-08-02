App.ApplicationMenuItemView = Em.View.extend
  template: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  displayName: null
  action: null
  click: (e) -> App.router.send this.get("action")
  classNameBindings: ["active"]
  stateName: null
  currentStateNameBinding: "App.router.currentState.path"
  active: ( -> this.get("currentStateName").match(this.get "stateName")!=null ).property("currentStateName", "stateName")
