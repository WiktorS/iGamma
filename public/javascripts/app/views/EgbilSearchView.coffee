App.EgbilSearchView = Em.View.extend
  templateName: "egbilSearch"

  didInsertElement: ->
    #add dummy div with size of sidebar to fix affix behavior
    nav = @$(".nav")
    div = $("<div/>", {class: "span"})
    div.outerWidth nav.outerWidth()
    div.outerHeight nav.outerHeight()
    nav.parent().prepend div
    nav.affix
      offset:
        top: 105
