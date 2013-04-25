App.ModalView = Em.View.extend
  classNames: [ "modal", "fade", "hide" ]
  destroyAfterHide: true

  showModal: ->
    @$().modal()
    @$().css
      "width": "auto"
      "min-width": "560px"
      "margin-left": "-50%" #modal left is 50% by default, so to get right width we have to override this somehow
    Em.run.next @, ->
      @$().css
        # calculate correct left margin
        "margin-left": -(@$().width() / 2)
        # set width to constant and add additional 20px for scrollbar. Fixes problem with wraping modal content when there is vertiacal scrollbar
        "width": "#{(@$().width() + 20)}px"
      #fix modal z-index when stacking modals (TODO: tricky fix)
      highestModalZIndex = Math.max(parseInt($(item).css("z-index") for item in $("body .modal")))
      @$().css("z-index", (highestModalZIndex || 1050)+10)
      @$().next(".modal-backdrop").css("z-index", (highestModalZIndex || 1050))

  hideModal: ->
    @$().modal "hide"

  didInsertElement: ->
    @_super()
    @$().on "show", @, => @onShow.apply @, arguments
    @$().on "shown", @, => @onShown.apply @, arguments
    @$().on "hide", @, => @onHide.apply @, arguments
    @$().on "hidden", @, =>
      @onHidden.apply @, arguments
      @destroy() if @get "destroyAfterHide"
    @showModal()

  onShow: Em.K
  onShown: Em.K
  onHide: Em.K
  onHidden: Em.K

App.ModalView.reopenClass
  modal: ->
    result = @create.apply(@, arguments)
    result.append()
