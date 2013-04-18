App.RankingsLandsIndexController = Em.Controller.extend
  #input params
  content: null

  disableFullScope: (-> "full" != @get "content.scope").property("content.scope")
  disableSelectedScope: (-> "selected" != @get "content.scope").property("content.scope")
  disableStateDay: (-> "forDay" != @get("content.state") || "selected" != @get("content.scope")).property("content.state", "content.scope")
