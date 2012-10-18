App.SystematicModalView = App.ModalView.extend
  templateName: "systematicModal"
  systematics: Em.A()
  selectedSystematic: null
  selectSystematic: (systematicsArray) ->
    @set "selectedSystematic", systematicsArray

  onShow: ->
    @fetchSystematics()

  fetchSystematics: ->
    @set "systematics", Em.A()
    $.ajax
      url: "/getSystematics.json"
      success: (data) =>
        processNodes = (nodes) ->
          result = Em.A()
          if nodes?
            $.each nodes, (i,node) =>
              result.pushObject App.SystematicModel.create
                name: node.name
                children: processNodes(node.children)
              true
          result
        @set "systematics", processNodes data
