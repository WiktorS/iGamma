App.TabItemView = Em.View.extend
  defaultTemplate: Em.Handlebars.compile ("<a>{{view.displayName}}</a>")
  tagName: "li"
  classNameBindings: ["active"]
  displayName: null
  routeName: null
  object: null
  router: (-> return @get("controller").container.lookup("router:main")).property() #taken from ember.js LinkView
  click: ->
    args = Em.makeArray @get("routeName")
    args.addObject @get "object" if @get "object"
    @get("router").transitionTo.apply @get("router"), args
  active: (->
    args = Em.makeArray @get("routeName")
    args.addObject @get "object" if @get "object"
    @get("router").isActive.apply @get("router"), args
    ).property("router.url", "routeName", "object") #router.url (and not router) is intented, cause url changes and router does not!


App.ObjectTabItemView = App.TabItemView.extend
  templateName: "objectTabItem"
  routeNameBinding: "object._objectRoute"
  displayNameBinding: "object._objectName"
  click: -> @get("router").send "showObject", @get("object")
