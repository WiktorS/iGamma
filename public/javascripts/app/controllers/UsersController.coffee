App.UsersController = Em.ArrayController.extend
  needs: "gammaAuth"

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView
  addingUser: (-> @get("router").isActive "users.add").property("router.url")

  addUser: -> @transitionToRoute "users.add"
