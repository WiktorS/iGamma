App.Route = Em.Route.extend
  defaultRoute: null
  defaultRouteModel: null
  #its rather unlikely that these computed properties will ever change
  parent: (->
    for handlerInfo in @router.router.currentHandlerInfos
      current = handlerInfo.handler
      if current == @
        return parent
      parent = current
    null
    ).property()
  isDynamic: (->
    for handlerInfo in @router.router.currentHandlerInfos
      if handlerInfo.handler == @
        return handlerInfo.isDynamic
    false
    ).property()
  isLeafRoute: (-> !!@get("routeName").match(/^(index|.+\..+)$/)).property() # match index or <sth>.<sth> (don't change / to ")
  isIndexRoute: (-> !!@get("routeName").match(/(^|.+\.)index$/)).property() # match index or <sth>.index (don't change / to ")

  activate: ->
    routeName = @get("routeName")
    if !@get "isIndexRoute"
      parent = @get "parent"
      if parent?
        parent.set "defaultRoute", routeName
        if @get("isDynamic") #save model only is this is dynamic route
          parent.set "defaultRouteModel", @get "context" # or maybe better @modelFor(routeName)
  redirect: ->
    if @get "isLeafRoute"
      parent = @get "parent"
      defaultRoute = parent.get "defaultRoute"
      defaultRouteModel = parent.get "defaultRouteModel"
      if !Em.isEmpty(defaultRoute) && defaultRoute != @get("routeName")
        if Em.isEmpty defaultRouteModel
          @transitionTo defaultRoute
        else
          @transitionTo defaultRoute, defaultRouteModel

App.ApplicationRoute = Ember.Route.extend
  defaultRoute: "egbil"
  events:
    #Object events
    openObject: (context) ->
      @controllerFor("gamma").openObject context.get("_objectId"), context.get("_objectType")
    # closeObject: (context) ->
    #   @controllerFor("gamma").closeObject context.get("_objectId"), context.get("_objectType")
    showObject: (context) ->
      @controllerFor("gamma").showObject context.get("_objectId"), context.get("_objectType")
    goToObject: (context) ->
      objectRoute = context.get("_objectRoute")
      @transitionTo objectRoute, context

    # Print events
    printForm: (params, printForm, action) ->
      printForm.attr "action", action
      #append hidden fields with values to submit
      hiddenInputs = []
      for param in params
        if param.value && printForm.find("input[name='#{param.name}']").length == 0
          if Em.isArray(param.value)
            #WARNING: not all combinations are covered here, enough for now
            for item,i in param.value
              if typeof item == "object"
                for own key,value of item
                  hiddenInputs.addObject $("<input/>", {type: "hidden", name: "#{param.name}[#{i}][#{key}]"}).val(value).appendTo(printForm)[0]
              else
                hiddenInputs.addObject $("<input/>", {type: "hidden", name: "#{param.name}[#{i}]"}).val(item).appendTo(printForm)[0]
          else
            hiddenInputs.addObject $("<input/>", {type: "hidden", name: param.name}).val(param.value).appendTo(printForm)[0]
      # #generate unique popup window
      # target = "print-popup-" + (new Date()).valueOf()
      # printForm.attr "target", target
      # printForm.one "submit", -> window.open "", target
      printForm.submit()
      #cleanup the mess
      $(hiddenInputs).remove()
    openTerrainCategoryReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param({object: context}))
      url = "/getTerrainCategorySummary?#{args}"
      window.open(url)
    openReservation: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getReservation?#{args}"
      window.open(url)
    openCustomReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getCustomReport?#{args}"
      window.open(url)
    openDifferenceReport: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getDifferenceReport?#{args}"
      window.open(url)
    showScan: (context) -> #TODO: Check is it ok after conversion
      args = decodeURIComponent($.param(context))
      url = "/getScan?#{args}"
      window.open(url)

    # Authentication events
    login: (context, callback) ->
      xhr = @controllerFor("gammaAuth").login(context.get("username"), context.get("password"))
      xhr.always(callback)

    logout: ->
      @controllerFor("gammaAuth").logout()
