App.StateButtonItemView = Em.View.extend
  template: Em.Handlebars.compile ('<i {{bindAttr class="view.icon"}}></i>')
  tagName: "a"
  attributeBindings: ["href", "rel", "title"]
  href: "#"
  rel: "tooltip"
  title: null
  icon: null
  classNames: ["btn", "btn-primary"]
  didInsertElement: -> @$().tooltip()
