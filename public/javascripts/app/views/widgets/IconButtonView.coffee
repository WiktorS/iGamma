App.IconButtonView = Em.View.extend
  template: Em.Handlebars.compile ('<i {{bindAttr class="view.icon"}}></i>')
  tagName: "a"
  attributeBindings: ["href", "rel", "title"]
  href: "#"
  rel: "tooltip"
  type: null
  title: null
  icon: null
  classNames: ["btn", "btn-primary"]
  init: ->
    @icon = iconDescriptions[@type].icon
    @title = iconDescriptions[@type].title
  didInsertElement: -> @$().tooltip()


iconDescriptions = []
iconDescriptions["subject"] = {
  icon: "icon-paper-clip"
  title: "wyszukiwanie przedmiotu"
}
iconDescriptions["individual"] = {
  icon: "icon-user"
  title: "wyszukiwanie osoby"
}
iconDescriptions["institution"] = {
  icon: "icon-group"
  title: "wyszukiwanie instytucji"
}
iconDescriptions["communityLand"] = {
  icon: "icon-legal"
  title: "wyszukiwanie zarządu wspólnoty gruntowej"
}
iconDescriptions["advanced"] = {
  icon: "icon-tasks"
  title: "wyszukiwanie szczegółowe"
}
