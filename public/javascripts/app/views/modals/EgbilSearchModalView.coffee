App.EgbilSearchModalView = App.ModalView.extend
  templateName: "egbilSearchModal"

  content: App.EgbilSearchModel.create()

  enabledTabs: null
  disableJrg: (-> !@get("enabledTabs").contains "jrg" ).property("enabledTabs")
  disableJrb: (-> !@get("enabledTabs").contains "jrb" ).property("enabledTabs")
  disableJrl: (-> !@get("enabledTabs").contains "jrl" ).property("enabledTabs")
  disableLot: (-> !@get("enabledTabs").contains "lot" ).property("enabledTabs")
  disableBuilding: (-> !@get("enabledTabs").contains "building" ).property("enabledTabs")
  disableLocal: (-> !@get("enabledTabs").contains "local" ).property("enabledTabs")

  activeTab: null
  isActiveJrg: (-> "jrg" == @get "activeTab").property("activeTab")
  isActiveJrb: (-> "jrb" == @get "activeTab").property("activeTab")
  isActiveJrl: (-> "jrl" == @get "activeTab").property("activeTab")
  isActiveLot: (-> "lot" == @get "activeTab").property("activeTab")
  isActiveBuilding: (-> "building" == @get "activeTab").property("activeTab")
  isActiveLocal: (-> "local" == @get "activeTab").property("activeTab")

  showJrg: ->
    if !@get "disableJrg"
      @set "activeTab", "jrg"
  showJrb: ->
    if !@get "disableJrb"
      @set "activeTab", "jrb"
  showJrl: ->
    if !@get "disableJrl"
      @set "activeTab", "jrl"
  showLot: ->
    if !@get "disableLot"
      @set "activeTab", "lot"
  showBuilding: ->
    if !@get "disableBuilding"
      @set "activeTab", "building"
  showLocal: ->
    if !@get "disableLocal"
      @set "activeTab", "local"

  doSearch: ->
    activeTab = @get "activeTab"
    content = @get "content"
    @get("controller").doSearch(activeTab, content)
    @hideModal()
