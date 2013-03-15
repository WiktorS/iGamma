App.GammaSearchView = Em.View.extend
  didInsertElement: ->
    @get("controller").clearSearchFields?()