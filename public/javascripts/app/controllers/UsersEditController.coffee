App.UsersEditController = Em.ObjectController.extend
  isNotActive: Em.computed.not("isActive")
  # User Tab
  isActive: null
  login: null
  firstName: null
  lastName: null

  disableUserUpdate: (-> false).property()

  # Password Tab
  password: null
  passwordValidation: null

  passwordsEmpty: (-> Em.isEmpty(@get("password")) || Em.isEmpty(@get("passwordValidation"))).property("password", "passwordValidation")
  passwordsEqual: (-> @get("password") == @get("passwordValidation")).property("password", "passwordValidation")
  disablePasswordUpdate: (-> !@get("passwordsEqual")).property("passwordsEqual")

  passwordValidationTimeout: null
  _passwordChanged: (->
    clearTimeout @get "passwordValidationTimeout"
    if !@get "passwordsEmpty"
      if @get "passwordsEqual"
        #if it is correct at this moment - hide alert
        @hideUserAlert()
      else
        @set "passwordValidationTimeout", setTimeout((=>
          if @get("passwordsEqual")
            @hideUserAlert()
          else
            @showUserAlert false, "", "Hasła nie są zgodne!"
          ), 500)
    else
      @hideUserAlert()
    ).observes("password", "passwordValidation")

  userAlert: false
  userAlertSuccess: false
  userAlertError: false
  userAlertTitle: ""
  userAlertMessage: ""
  showUserAlert: (isSuccess, title, message) ->
    @set "userAlertSuccess", isSuccess
    @set "userAlertError", !isSuccess
    @set "userAlertTitle", title
    @set "userAlertMessage", message
    @set "userAlert", true
  hideUserAlert: ->
    @set "userAlert", false

  updateUser: (content) ->
    if @get "passwordsEqual"
      content.set "isActive", @get "isActive"
      content.set "firstName", @get "firstName"
      content.set "lastName", @get "lastName"
      content.update(@get("login"), @get("password"))
      .done =>
        @showUserAlert true, "Sukces", "Zmiany zostały poprawnie zapisane"
      .fail =>
        @showUserAlert false, "Błąd", "Wystąpił błąd podczas zapisywania zmian"
    else
      @showUserAlert false, "", "Hasła nie są zgodne!"

  deleteUser: (content) ->
    content.delete()
    .done =>
      @send "goToUserList"
    .fail =>
      @showUserAlert false, "Błąd", "Wystąpił błąd podczas usuwania"
