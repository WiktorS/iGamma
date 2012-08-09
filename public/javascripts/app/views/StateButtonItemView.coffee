App.StateButtonItemView = Em.View.extend
  template: Em.Handlebars.compile ('<i {{bindAttr class="view.icon"}}></i>')
  tagName: "a"
  icon: null
#  click: (e) -> App.router.transitionTo this.get("stateName")
#  classNameBindings: ["active"]
#  active: ( -> this.get("currentStateName").match("\\."+this.get("stateName")+"(\\.|$)")!=null ).property("currentStateName", "stateName")
