App.GammaCacheController = Em.Controller.extend
  _cacheValidTime: 30 #minutes
  systematics: Em.A()
  cadastralUnits: Em.A()
  precincts: Em.A()

  init: ->
    @_super()
    #root node of systematics
    @get("systematics").addObject Em.Object.create
      parentId: null
      id: 0

  getSystematics: (idList = Em.A(), callback) ->
    systematics = @get "systematics"
    rootFetch = Em.isEmpty(idList)
    if rootFetch
      cachedSystematics = Em.makeArray(systematics.find((item) -> item.id == 0))
    else
      cachedSystematics = systematics.filter((item) -> idList.contains(item.id))
    validDate = new Date()
    validDate.setMinutes(validDate.getMinutes() - @get("_cacheValidTime"))
    outdatedCachedSystematics = cachedSystematics.filter((item) -> !(cacheDate = item.get("_cacheDate")) || cacheDate < validDate)
    fetchIdList = Em.A()
    if !Em.isEmpty(outdatedCachedSystematics) && !rootFetch
      for systematicObj in outdatedCachedSystematics
        fetchIdList.addObject systematicObj.id
        systematics.removeObject systematicObj
    if !Em.isEmpty(outdatedCachedSystematics)
      App.Common.ajax
        url: "getSystematics.json"
        data:
          parentIdList: fetchIdList
        success: (data) ->
          for node in (data || [])
            if node
              systematic = App.SystematicModel.create
                parentId: node.parentId
                id: node.id
                name: node.name
                desc: node.desc
              systematics.removeObject oldSystematic if (oldSystematic = systematics.findProperty "id", node.id)
              systematics.addObject systematic
          if rootFetch
            systematics.findProperty("id", 0)?.set "_cacheDate", new Date()
          else
            for id in fetchIdList
              systematics.findProperty("id", id)?.set "_cacheDate", new Date()
          callback?.call callback
    else
      callback?.call callback

  getCadastralUnits: (callback) ->
    cadastralUnits = @get("cadastralUnits")
    validDate = new Date()
    validDate.setMinutes(validDate.getMinutes() - @get("_cacheValidTime"))
    outdatedCadastralUnits = cadastralUnits.filter((item) -> !(cacheDate = item.get("_cacheDate")) || cacheDate < validDate)
    if !Em.isEmpty(outdatedCadastralUnits)
      for systematicObj in outdatedCadastralUnits
        cadastralUnits.removeObject systematicObj
    if !Em.isEmpty(outdatedCadastralUnits) || Em.isEmpty(cadastralUnits)
      App.Common.ajax
        url: "getCadastralUnits.json"
        success: (data) ->
          for item in (data || [])
            if item
              cadastralUnit = App.Common.toModel.call(App.CadastralUnitModel, item)
              cadastralUnits.set("_cacheDate", new Date())
              cadastralUnits.removeObject oldCadastralUnit if (oldPrecinct = cadastralUnits.findProperty "id", item.id)
              cadastralUnits.addObject cadastralUnit
          Em.run.sync() #sync bindings!
          callback?.call(callback)
    else
      callback?.call(callback)

  getPrecincts: (idList, callback) ->
    precincts = @get "precincts"
    cachedPrecincts = precincts.filter((item) -> idList.contains(item.id))
    fetchIdList = Em.makeArray idList.filter((id) -> !cachedPrecincts.someProperty("id", id))
    validDate = new Date()
    validDate.setMinutes(validDate.getMinutes() - @get("_cacheValidTime"))
    outdatedCachedPrecincts = cachedPrecincts.filter((item) -> !(cacheDate = item.get("_cacheDate")) || cacheDate < validDate)
    if !Em.isEmpty(outdatedCachedPrecincts)
      for outdated in outdatedCachedPrecincts
        fetchIdList.addObject outdated.id
        precincts.removeObject outdated
    if !Em.isEmpty(fetchIdList)
      App.Common.ajax
        url: "getPrecincts.json"
        data:
          idList: fetchIdList
        success: (data) ->
          for item in (data || [])
            if item
              precinct = App.Common.toModel.call(App.PrecinctModel, item)
              precinct.set "_cacheDate", new Date()
              precincts.removeObject oldPrecinct if (oldPrecinct = precincts.findProperty "id", item.id)
              precincts.addObject precinct
          Em.run.sync() #sync bindings!
          callback?.call callback
    else
      callback?.call callback
