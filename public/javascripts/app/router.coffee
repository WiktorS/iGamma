App.Router = Em.Router.extend
  location:"hash"
  enableLogging:false
  root:Ember.Route.extend
    index:Ember.Route.extend
      route:'/'
