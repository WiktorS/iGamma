App.IconButtonView = Em.View.extend
  template: Em.Handlebars.compile ('<i {{bindAttr class="view.icon"}}></i>')
  tagName: "a"
  attributeBindings: ["rel", "title", "data-toggle", "href"]
  rel: "tooltip"
  'data-toggle': "tab"
  classNames: ["btn", "btn-primary"]
  type: null
  title: null
  icon: null
  href: null
  init: ->
    @_super()
    @icon = iconDescriptions[@type].icon
    @title = iconDescriptions[@type].title
    @href = iconDescriptions[@type].href
  didInsertElement: -> @$().tooltip()
  click: (event) ->
    @$().addClass "active"
    @$().siblings().removeClass "active"



iconDescriptions = []
iconDescriptions["subject"] = {
  icon: "icon-paper-clip"
  title: "wyszukiwanie przedmiotu"
  href: "#filter-subject"
}
iconDescriptions["individual"] = {
  icon: "icon-user"
  title: "wyszukiwanie osoby"
  href: "#filter-individual"
}
iconDescriptions["institution"] = {
  icon: "icon-group"
  title: "wyszukiwanie instytucji"
  href: "#filter-institution"
}
iconDescriptions["communityLand"] = {
  icon: "icon-legal"
  title: "wyszukiwanie zarządu wspólnoty gruntowej"
  href: "#filter-communityLand"
}
iconDescriptions["advanced"] = {
  icon: "icon-tasks"
  title: "wyszukiwanie szczegółowe"
  href: "#filter-advanced"
}
