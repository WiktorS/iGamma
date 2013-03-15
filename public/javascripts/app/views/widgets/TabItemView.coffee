App.TabItemView = Em.View.extend
  defaultTemplate: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  classNameBindings: ["active"]
  displayName: null
  routeName: null
  router: (-> return @get("controller").container.lookup("router:main")).property() #taken from ember.js LinkView
  click: (e) -> @get("router").transitionTo this.get("routeName")
  active: (->
    @get("router").isActive @get("routeName")
    ).property("router.url", "routeName") #router.url (and not router) is intented, cause url changes and router does not!


App.ObjectTabItemView = App.TabItemView.extend
  object: null
  templateName: "objectTabItem"
  routeNameBinding: "object._objectRoute"
  displayNameBinding: "object._objectName"
  currentStateObjectNameBinding: "controller.target.currentState.objectName"
  click: (e) ->
    @get("router").send "showObject", @get("object")
  active: (->
    @get("router").isActive @get("routeName"), @get("object")
    ).property("router.url", "routeName", "object")
