App.LoginModalView = App.ModalView.extend
  templateName: "loginModal"

  modalOptions:
    backdrop: "static"
    keyboard: false

  content: null

  alertVisiable: null
  alertTitle: null
  alertMessage: null
  loginInProgress: null

  init: ->
    @_super()
    @set "content", Em.Object.create
      username: ""
      password: ""
    @set "alertTitle", "Błąd"
    @set "alertMessage", ""

  login: ->
    if !@isValidData()
      @set "alertMessage", "Niepoprawna nazwa użytkownika lub hasło"
      @alertShow true
    else if !@get "loginInProgress"
      @set "loginInProgress", true
      @alertShow false
      #processed with login
      #TODO: In some rare cases it is not possible to send event because no route is connected yet
      @get("controller.target").send "login", @get("content"), (xhr, status, thrown) =>
        if status == "success"
          @hideModal()
        else
          @set "alertMessage", xhr.responseText || thrown
          @alertShow true
        @set "loginInProgress", false

  alertShow: (show)->
    if show
      @$(".alert").show "fast", => @set "alertVisiable", show
    else
      @$(".alert").hide "fast", => @set "alertVisiable", show

  isValidData: -> !!@get("content.username") && !!@get("content.password")

  didInsertElement: ->
    @_super()
    @$(".alert .close").on "click", =>
      @alertShow false
    @$("form").on "keypress", (e) =>
      if e.keyCode == 13
        @login()
        false

  onShown: ->
    @$("form input:first").focus()
