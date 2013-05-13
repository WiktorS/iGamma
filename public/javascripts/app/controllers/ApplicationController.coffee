App.ApplicationController = Em.Controller.extend
  needs: ["gammaAuth"]

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView

  isAuthenticatedBinding: "controllers.gammaAuth.isDataValid"
  isLoginModalShown: false

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
    #source: https://docs.djangoproject.com/en/dev/ref/contrib/csrf/
    $.ajaxSetup
        crossDomain: false
    #     beforeSend: (xhr, settings) ->
    #       csrfSafeMethod = (method) ->
    #         # these HTTP methods do not require CSRF protection
    #         (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method))
    #       if !csrfSafeMethod(settings.type)
    #           xhr.setRequestHeader "X-CSRFToken", App.GammaAuth.getAuthToken()
        error: (jqXHR, status, errorThrown) ->
          if jqXHR.status == 403 #TODO: Additional check to force login only when calling backend
            @get("controllers.gammaAuth").clearUserData()

  showLoginModal: ->
    #Navigating forward/bakward in browser will trigger _urlChanged observer and in result show several LoginModals
    if !@get "isLoginModalShown"
      App.LoginModalView.modal
        controller: @
        onShow: => @set "isLoginModalShown", true
        onHidden: => @set "isLoginModalShown", false
