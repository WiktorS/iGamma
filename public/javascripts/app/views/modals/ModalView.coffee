App.ModalView = Em.View.extend
  classNames: [ "modal", "fade", "hide" ]
  destroyAfterHide: true
  modalOptions: {}

  keepFocusOnModal: ->
    focusinHandler = (e) =>
      if $(e.target).parents().index(@$()) == -1
        #if focus is outside of modal, set focus on first posible element
        @$("input, select, textarea, button, object").filter("[tabindex != '-1']:visible").first().focus()
        false
    oldFocusinHandler = null
    @$().on "show", =>
      #TODO: Argh... hacky
      for event in $._data($(document)[0], "events").focusin
        if event.namespace == "modal"
          oldFocusinHandler = event.handler
      $(document).off "focusin"
      $(document).on "focusin", focusinHandler
    @$().on "hide", =>
      $(document).off "focusin", focusinHandler
      $(document).on "focusin", oldFocusinHandler if oldFocusinHandler

  fixModalStacking: ->
    #backdrop fix
    addedModalOpenClass = false
    @$().on "show", =>
      addedModalOpenClass = !$("body").hasClass "modal-open"
      $("body").addClass "modal-open"
    @$().on "hidden", => $("body").removeClass "modal-open" if addedModalOpenClass
    #
    Em.run.next @, ->
      #fix z-indexes when stacking modals (TODO: fix is hacky, maybe there is better solution)
      highestModalZIndex = Math.max(parseInt($(item).css("z-index") for item in $("body .modal")))
      @$().css("z-index", (highestModalZIndex || 1050)+10)
      @$().next(".modal-backdrop").css("z-index", (highestModalZIndex || 1050))

  showModal: ->
    @$().modal(@get "modalOptions")
    @$().css
      "width": "auto"
      "min-width": "560px"
      "margin-left": "-50%" #modal left is 50% by default, so to get right width we have to override this somehow
    Em.run.next @, ->
      @$().css
        # calculate correct left margin
        "margin-left": "-#{@$().width() / 2}px"
        # set width to constant and add additional 20px for scrollbar. Fixes problem with wraping modal content when there is vertiacal scrollbar
        "width": "#{(@$().width() + 20)}px"

  hideModal: ->
    @$().modal "hide"

  didInsertElement: ->
    @_super()
    #fixes
    @keepFocusOnModal()
    @fixModalStacking()
    #event callbacks
    @$().on "show", => @onShow.apply @, arguments
    @$().on "shown", => @onShown.apply @, arguments
    @$().on "hide", => @onHide.apply @, arguments
    @$().on "hidden", => @onHidden.apply @, arguments
    #destroy
    @$().on "hidden", => @destroy() if @get "destroyAfterHide"
    #
    @showModal()

  onShow: Em.K
  onShown: Em.K
  onHide: Em.K
  onHidden: Em.K

App.ModalView.reopenClass
  modal: ->
    result = @create.apply(@, arguments)
    result.append()
