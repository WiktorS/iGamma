App.LoginModalView = App.ModalView.extend
  templateName: "loginModal"

  modalOptions:
    backdrop: "static"
    keyboard: false

  content: null
  disableLogin: false

  init: ->
    @_super()
    @set "content", Em.Object.create
      username: ""
      password: ""

  login: ->
    @set "disableLogin", true
    @get("controller.target").send "login", @get("content"), (jqXHR, status) =>
      if status == "success"
        @hideModal()
      else
        debugger
