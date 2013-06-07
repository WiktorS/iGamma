App.UsersAddView = Em.View.extend
  templateName: "users/add"

  _userAlertChanged: (->
    userAlert = @get "controller.userAlert"
    if userAlert
      @$(".alert")?.show "fast"
    else
      @$(".alert")?.hide "fast"
    ).observes("controller.userAlert")

  didInsertElement: ->
    @_super()
    @$(".alert .close").on "click", =>
      @set "controller.userAlert", false
