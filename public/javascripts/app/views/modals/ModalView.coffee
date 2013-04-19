App.ModalView = Em.View.extend
  classNames: [ "modal", "fade", "hide" ]
  destroyAfterHide: true

  showModal: ->
    @$().modal()
    @$().css
      'width': 'auto'
      'min-width': '560px'
      'margin-left': => -(@$().width() / 2)

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
