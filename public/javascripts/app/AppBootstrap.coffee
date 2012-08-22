$ ->
  $("body").layout
    defaults:
      resizable: false
      slidable: false
      closable: false
      spacing_open: false

  do App.initialize
