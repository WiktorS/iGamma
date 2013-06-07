App.UsersEditView = Em.View.extend
  templateName: "users/edit"

  _userAlertChanged: (->
    userAlert = @get "controller.userAlert"
    if userAlert
      @$(".alert")?.show "fast"
    else
      @$(".alert")?.hide "fast"
    ).observes("controller.userAlert")

  didInsertElement: ->
    @_super()
    @$(".has-tooltip").tooltip
      delay: 200
      container: "body"
    @$(".alert .close").on "click", =>
      @set "controller.userAlert", false
