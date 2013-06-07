App.UsersAddController = Em.Controller.extend
  # User Tab
  # isActive: null
  login: null
  firstName: null
  lastName: null
  # permissions: null

  # Password Tab
  password: null
  passwordValidation: null

  passwordsEmpty: (-> Em.isEmpty(@get("password")) || Em.isEmpty(@get("passwordValidation"))).property("password", "passwordValidation")
  passwordsEqual: (-> @get("password") == @get("passwordValidation")).property("password", "passwordValidation")

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

  addUser: (content)->
    App.UserModel.addUser(@get("login"), @get("password"), @get("firstName"), @get("lastName"), @get("permissions"))
    .done =>
      @showUserAlert true, "Sukces", "Zmiany zostały poprawnie zapisane"
      @send "goToUserByLogin", @get("login")
    .fail =>
      @showUserAlert false, "Błąd", "Wystąpił błąd podczas zapisywania zmian"
