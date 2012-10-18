App.SystematicNodeView = Em.View.extend
  templateName: "systematicNode"
  node: null
  isExpanded: false
  isSelected: (->
    @get("node.name") == @get("parentView.selectedSystematic.0")
    ).property("parentView.selectedSystematic")
  displayValue: (->@get "node.name").property("node.name")

  selectedSystematic: (->
      systematics = @get("parentView.selectedSystematic")
      if systematics.length
        systematics.slice(1)
      else
        systematics
    ).property("parentView.selectedSystematic")
  selectSystematic: (systematicsArray) ->
    systematicsArray.insertAt 0, @get("node.name")
    @get("parentView").selectSystematic systematicsArray

  didInsertElement: ->
    @set "isExpanded", (@get("isSelected") && @get("node.children.length") > 0)

  doToggleExpand: ->
    @set "isExpanded", !@get("isExpanded")

  doSelect: ->
    @selectSystematic Em.A()
    @$().closest(".modal").modal "hide"
