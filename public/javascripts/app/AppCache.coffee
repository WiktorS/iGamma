App.Cache = Em.Object.create
  systematics: Em.Object.create
    cache: Em.A()

    init: ->
      @_super()
      @get("cache").addObject Em.Object.create
        parentId: null
        id: 0

    getSystematics: (idList = Em.A(), callback = null) ->
      cachedSystematics = @get("cache").filter((item, index, enumerable) => idList.contains(item.id))
      validDate = new Date()
      validDate.setMinutes(validDate.getMinutes() - 30)
      outdatedCachedSystematics = cachedSystematics.filter((item, index, enumerable) => !item.cacheDate? || item.cacheDate < validDate)
      fetchIdList = Em.A()
      if !Em.empty(outdatedCachedSystematics)
        for systematicObj in outdatedCachedSystematics
          fetchIdList.addObject systematicObj.id
      if !Em.empty(fetchIdList) || Em.empty(idList)
        $.ajax
          url: "/getSystematics.json"
          data:
            parentIdList: fetchIdList
          success: (data) =>
            if data?
              for node in data
                if node
                  foundNode = @get("cache").findProperty("id", node.id)
                  if foundNode?
                    idx = @get("cache").indexOf foundNode
                    foundNode.set("parentId", node.parentId)
                    foundNode.set("id", node.id)
                    foundNode.set("name", node.name)
                    foundNode.set("desc", node.desc)
                  else
                    newNode = App.SystematicModel.create
                      parentId: node.parentId
                      id: node.id
                      name: node.name
                      desc: node.desc
                    @get("cache").addObject newNode

            if Em.empty fetchIdList
              foundNode = @get("cache").findProperty("id", 0)
              foundNode?.set("cacheDate", new Date())
            else
              for id in fetchIdList
                node = @get("cache").findProperty("id", id)
                node?.set("cacheDate", new Date())
            callback?.call(callback)
            return
      else
        callback?.call(callback)

