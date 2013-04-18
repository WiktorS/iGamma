App.ModalView = Em.View.extend
  classNames: [ "modal", "fade", "hide" ]
  destroyAfterHide: true

  showModal: ->
    @$().modal()
    @$().css
      'width': 'auto'
      'min-width': '560px'
      'margin-left': -> -($(this).width() / 2)

  hideModal: ->
    @$().modal "hide"

  didInsertElement: ->
    @_super()
    @on "show", @, (e) -> @onShow(e)
    @on "shown", @, (e) -> @onShown(e)
    @on "hide", @, (e) -> @onHide(e)
    @on "hidden", @, (e) ->
      @onHidden(e)
      @destroy() if @get "destroyAfterHide"
    @showModal()

  onShow: Em.K
  onShown: Em.K
  onHide: Em.K
  onHidden: Em.K

App.ModalView.reopenClass
  modal: ->
    result = @create.apply(this, arguments)
    result.append()
