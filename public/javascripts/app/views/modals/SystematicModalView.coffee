App.SystematicModalView = App.ModalView.extend
  templateName: "systematicModal"
  cache: null
  systematics: null
  selectedSystematic: null
  selectSystematic: (systematicsArray) ->
    @set "selectedSystematic", systematicsArray
  rootSystematics: (->
    idList = @get("systematics")?.findProperty("id", 0).get("children")
    for id in (idList ? [])
      @get("systematics").findProperty("id",id)
    ).property("systematics.@each")

  onShow: ->
    @set "systematics", Em.A()
    @get("systematics").addObject App.SystematicModel.create
      id: 0
      name: "root"
    @fetchSystematics()

  fetchSystematics: (parentId = 0) ->
    idList = Em.A()
    for id in (@get("systematics").findProperty("id", parentId)?.get("children") ? Em.A())
      idList.addObject id
    if (parentId == 0 || !Em.isEmpty(idList))
      @get("cache").getSystematics idList, =>
        for node in @get("cache.systematics").filter((item, index, enumerable) =>
          item.parentId? && (Em.isEmpty(idList) || idList.contains(item.parentId))
        )
          if node?
            parentNode = @get("systematics").findProperty("id", node.parentId)
            Em.assert "Systematic of ID: #{node.parentId} does'nt exist", parentNode

            parentNode.set("children", Em.A()) if !Em.isArray(parentNode.get "children")
            parentNode.get("children").addObject node.id

            if !@get("systematics").findProperty("id", node.id)
              @get("systematics").addObject App.SystematicModel.create
                id: node.id
                name: node.name
                desc: node.desc
