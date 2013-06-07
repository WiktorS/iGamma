App.UserModel = App.GammaObjectModel.extend
  _objectType: "user"
  _objectName: (->
    login = @get "login"
    firstName = @get "firstName"
    lastName = @get "lastName"
    if (firstName || lastName)
      "#{firstName} #{lastName} (#{login})"
    else
      "#{login}"
    ).property("login", "firstName", "lastName")

  login: null
  firstName: null
  lastName: null
  isActive: null
  permissions: null


  init: ->
    @_super()
    #this model does not provide id to fetch data on demand, so it is assumed that data are already here
    @set "_dataStatus", App.GammaObjectStatus.READY

  update: (newLogin, newPassword) ->
    data = @getProperties("login", "firstName", "lastName", "isActive", "permissions")
    data.newLogin = newLogin if newLogin
    data.newPassword = newPassword if newPassword
    App.Common.ajax
      type: "POST"
      url: "api/updateUser.json"
      data: data
    .done(=> @set "login", newLogin if newLogin)

  delete: ->
    App.Common.ajax
      type: "DELETE"
      url: "api/deleteUser.json"
      data: @getProperties("login")

App.UserModel.reopenClass
  getUserList: ->
    result = Em.A()
    deferred = $.Deferred()
    App.Common.ajax
      url: "api/getUserList.json"
    .done (data) ->
      result.addObjects Em.makeArray(data).map(App.Common.toModel, App.UserModel)
      deferred.resolve(result)
    .fail -> deferred.reject()
    deferred.promise(result)

  addUser: (login, password, firstName, lastName, permissions) ->
    App.Common.ajax
      type: "POST"
      url: "api/addUser.json"
      data:
        login: login
        password: password
        firstName: firstName
        lastName: lastName
        permissions: permissions
