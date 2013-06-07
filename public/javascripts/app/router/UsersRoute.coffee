App.UsersRoute = App.Route.extend
  defaultRoute: "users.list"
  neededPermissions: 1<<31

  model: (params)->
    @controllerFor("application")
    App.UserModel.getUserList()
  serialize: (model, params) ->
    result =
      login: model.get "login"

App.UsersAddRoute = App.Route.extend
  setupController: (controller, model) ->
    controller.set "login", ""
    controller.set "firstName", ""
    controller.set "lastName", ""
    controller.set "password", ""
    controller.set "passwordValidation", ""
    controller.hideUserAlert()

  events:
    goToUserByLogin: (login) ->
      usersList = @modelFor("users")
      App.UserModel.getUserList()
      .done (newList) =>
        usersList.clear()
        usersList.addObjects newList
        @transitionTo "users.edit", usersList.findProperty "login", login

App.UsersEditRoute = App.Route.extend
  model: (params) ->
    if params?
      @modelFor("users").findProperty "login", params.login

  serialize: (model, params) ->
    if model
      result =
        login: model.get "login"

  setupController: (controller, model) ->
    controller.set "isActive", model.get "isActive"
    controller.set "login", model.get "login"
    controller.set "firstName", model.get "firstName"
    controller.set "lastName", model.get "lastName"
    controller.set "password", ""
    controller.set "passwordValidation", ""
    controller.hideUserAlert()

  events:
    goToUserList: ->
      usersList = @modelFor("users")
      App.UserModel.getUserList()
      .done (newList) =>
        usersList.clear()
        usersList.addObjects newList
        @transitionTo "users.list"
