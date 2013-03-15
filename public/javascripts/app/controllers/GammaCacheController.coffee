App.GammaCacheController = Em.Controller.extend
  _cacheValidTime: 30 #minutes
  systematics: Em.A()

  init: ->
    @_super()
    #root node of systematics
    @get("systematics").addObject Em.Object.create
      parentId: null
      id: 0

  getSystematics: (idList = Em.A(), callback) ->
    cachedSystematics = @get("systematics").filter((item, index, enumerable) => idList.contains(item.id))
    validDate = new Date()
    validDate.setMinutes(validDate.getMinutes() - @get("_cacheValidTime"))
    outdatedCachedSystematics = cachedSystematics.filter((item, index, enumerable) => !item.cacheDate? || item.cacheDate < validDate)
    fetchIdList = Em.A()
    if !Em.isEmpty(outdatedCachedSystematics)
      for systematicObj in outdatedCachedSystematics
        fetchIdList.addObject systematicObj.id
    if !Em.isEmpty(fetchIdList) || Em.isEmpty(idList)
      $.ajax
        url: "/getSystematics.json"
        data:
          parentIdList: fetchIdList
        success: (data) =>
          if data?
            for node in data
              if node
                foundNode = @get("systematics").findProperty("id", node.id)
                if foundNode?
                  idx = @get("systematics").indexOf foundNode
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
                  @get("systematics").addObject newNode

          if Em.isEmpty fetchIdList
            foundNode = @get("systematics").findProperty("id", 0)
            foundNode?.set("cacheDate", new Date())
          else
            for id in fetchIdList
              node = @get("systematics").findProperty("id", id)
              node?.set("cacheDate", new Date())
          callback?.call(callback)
          return
    else
      callback?.call(callback)

