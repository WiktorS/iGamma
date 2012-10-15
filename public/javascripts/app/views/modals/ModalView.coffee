App.ModalView = Em.View.extend
  destroyAfterHide: true

  showModal: ->
    @$(".modal").modal
      backdrop: false

  hideModal: ->
    @$(".modal").modal "hide"

  didInsertElement: ->
    @_super()
    @$(".modal").on "show", (e) => @onShow(e)
    @$(".modal").on "shown", (e) => @onShown(e)
    @$(".modal").on "hide", (e) => @onHide(e)
    @$(".modal").on "hidden", (e) => @onHidden(e)
    @showModal()

  onShow: (e) ->
    return

  onShown: (e) ->
    return

  onHide: (e) ->
    return

  onHidden: (e) ->
    @destroy() if @get "destroyAfterHide"
    return

App.ModalView.reopenClass
  modal: ->
    result = @create.apply(this, arguments)
    #appendTo rootElement fixes event handling on modal, but messes up 'backdrop' dim
    result.appendTo App.get("rootElement")
