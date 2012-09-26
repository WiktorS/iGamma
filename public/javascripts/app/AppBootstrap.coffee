$ ->
  App.layout = $("body").layout
    defaults:
      resizable: false
      slidable: false
      closable: false
      spacing_open: false
      findNestedContent: true

  do App.initialize
