App.ApplicationController = Em.Controller.extend
  needs: ["gammaAuth"]

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView

  isAuthenticatedBinding: "controllers.gammaAuth.isDataValid"
  loginModal: null

  _urlChanged: (->
    #since this observer get called several times on "one" route change
    #use run.once to show login modal only once
    if !@get "isAuthenticated"
      Em.run.once @, "showLoginModal"
    ).observes("router.url")

  _isAuthencticatedChanged: (->
    if !@get "isAuthenticated"
      Em.run.once @, "showLoginModal"
    ).observes("isAuthenticated")

  init: ->
    @_super()
    @ajaxSetup()

  ajaxSetup: ->
    App.Common.setAjaxUnauthCallback (ajaxOptions, deferred) =>
      @showLoginModal()
      .done ->
        $.ajax(ajaxOptions)
        .done((data, status, xhr)-> deferred.resolveWith @, [data, status, xhr])
        .fail((xhr, status, error)-> deferred.rejectWith @, [xhr, status, error])

    #based on: https://docs.djangoproject.com/en/dev/ref/contrib/csrf/
    # gammaAuth = @get("controllers.gammaAuth")
    # $(document).ajaxSend (event, xhr, settings) ->
    #   csrfSafeMethod = (method) ->
    #     # these HTTP methods do not require CSRF protection
    #     /^(GET|HEAD|OPTIONS|TRACE)$/.test(method)
    #   if !csrfSafeMethod(settings.type)
    #       xhr.setRequestHeader "X-CSRFToken", gammaAuth.getAuthToken()
    # $(document).ajaxError (event, xhr, settings, errorThrown) ->
    #   if xhr.status == 403 #TODO: Additional check to force login only when calling backend
    #     gammaAuth.clearUserData()

  showLoginModal: ->
    #Navigating forward/bakward in browser will trigger _urlChanged observer and result in showing several LoginModals
    if !(modal = @get "loginModal")
      deferred = $.Deferred()
      modal = App.LoginModalView.modal
        controller: @
        onHide: =>
          Em.run.sync() #TODO: Why!?
          if @get "isAuthenticated"
            deferred.resolve()
          else
            deferred.reject()
        onHidden: => @set "loginModal", null
      deferred.promise(modal)
      @set "loginModal", modal
    modal
