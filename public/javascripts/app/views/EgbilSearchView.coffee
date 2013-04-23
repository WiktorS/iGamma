App.EgbilSearchView = Em.View.extend
  templateName: "egbilSearch"

  didInsertElement: ->
    nav = @$(".nav")
    @$("#egbil-search").css "margin-left", nav.outerWidth true
    sidebar = $("#egbil-sidebar")
    nav.affix
      offset:
        top: ->
          Em.run.next ->
            marginLeft = if sidebar.hasClass "affix" then "-#{$(window).scrollLeft()}px" else "0"
            sidebar.css "margin-left", marginLeft
            $("body").css "margin-right", marginLeft   #IE needs this
          105

  willDestroyElement: ->
    $("body").css "margin-right", 0   #IE needs this
