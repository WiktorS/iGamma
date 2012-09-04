App.Common = {}
App.Common.toModel = (x) ->
    output = @create()
    $.each(x, (key, value) =>
      output.get(key)?.value = value
    )
    output
