App.SystematicNodeView = Em.View.extend
  templateName: "systematicNode"
  node: null
  displayValue: (-> "#{@get "node.name"} - #{@get "node.desc"}").property("node.name", "node.desc")
  isExpandedBinding: "node.isExpanded"
  _isExpandedChanged: (->
    if @get "isExpanded"
      if (@get "isFetchSystematicsNeeded")
        @fetchSystematics @get("node.id")
    ).observes("isExpanded")
  isFetchSystematicsNeeded: (->
    for id in @get("node.children")
      childNode = @get("systematics").findProperty("id", id)
      return true if !childNode.get "children"
    return false
    ).property("node.children.@each", "systematics.@each.children")
  isSelected: (->
    @get("node.name") == @get("parentView.selectedSystematic.0")
    ).property("parentView.selectedSystematic")
  selectedSystematic: (->
    systematics = @get("parentView.selectedSystematic")
    if systematics.length
      systematics.slice(1)
    else
      systematics
    ).property("parentView.selectedSystematic")
  systematics: (->
    @get "parentView.systematics"
    ).property("parentView.systematics")
  nodeChildren: (->
    for id in @get("node.children") ? []
      @get("systematics").findProperty("id", id)
    ).property("node", "systematics.@each.children")


  selectSystematic: (systematicsArray) ->
    systematicsArray.insertAt 0, @get("node.name")
    @get("parentView").selectSystematic systematicsArray

  fetchSystematics: (parentId) ->
    @get("parentView").fetchSystematics parentId

  didInsertElement: ->
    if !@get "isExpanded"
      @set "isExpanded", (@get("isSelected") && @get("node.children.length") > 0)

  doToggleExpand: ->
    @set "isExpanded", !@get("isExpanded")

  doSelect: ->
    @selectSystematic Em.A()
    @$().closest(".modal").modal "hide"
