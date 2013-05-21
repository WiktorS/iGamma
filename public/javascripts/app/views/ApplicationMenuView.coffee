App.ApplicationMenuView = Em.View.extend
  templateName: "applicationMenu"

  user: (->
    login = @get("controller.login")
    fullName = @get("controller.fullName")
    if login
      "#{fullName} (#{login})"
    ).property("controller.login", "controller.fullName")
