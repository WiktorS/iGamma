App.GammaListView = Em.View.extend
  templateName: "gammaList"

  _checkedItemsCountChanged: (->
    @rightSideBar()
    ).observes("controller.isAnyChecked", "controller.canShowRightPanel")


  didInsertElement: ->
    @rightSideBar true

  rightSideBar: (noAnimation = false) -> 
      duration = if noAnimation then 0 else 'fast'
      if sidebar = @$("#right-sidebar")
        if @get("controller.isAnyChecked")  && @get("controller.canShowRightPanel")
          sidebar.show
            duration: duration
            always: =>
              @$("#list").css "margin-right", sidebar.outerWidth true
        else if sidebar.is ":visible"
          @$("#right-sidebar").hide
            duration: duration
            always: =>
              @$("#list").css "margin-right", 0
