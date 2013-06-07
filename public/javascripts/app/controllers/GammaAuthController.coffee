App.GammaAuthController = Em.Controller.extend
  username: ""
  fullname: ""
  csrftoken: ""
  permissions: 0

  isDataValid: (->
    !Em.isEmpty(@get "username") &&
    !Em.isEmpty(@get "fullname") &&
    !Em.isEmpty(@get "csrftoken")
    ).property("username", "fullname", "csrftoken")

  canAccessUsersTab: (-> (@get("permissions") & (1<<31)) == (1<<31)).property("permissions")

  getAuthToken: -> @get "csrftoken"

  getSecureUrl: (url) ->
    #TODO: If whole site won't be served through SSL, at least login should be!
    return url

  login: (username = "", password = "") ->
    $.ajax
      url: @getSecureUrl("login")
      type: "POST"
      username: username
      password: password
      success: (data) =>
        @setUserData(data.userName, data.fullName, data.authToken, data.permissions)

  logout: ->
    $.ajax
      url: @getSecureUrl("logout")
      type: "DELETE"
      complete: =>
        #Clear user data even if logout is unsuccessful
        @clearUserData()

  setUserData: (username, fullname, csrftoken, permissions)->
    @setProperties
      username: username
      fullname: fullname
      csrftoken: csrftoken
      permissions: permissions

  clearUserData: ->
    @setUserData "", "", "", 0
