App.Common =
  toModel: (x) ->
    output = @create()
    $.each(x, (key, value) =>
      output.get(key)?.set "value", value
    ) if x?
    output
