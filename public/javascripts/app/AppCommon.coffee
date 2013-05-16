ajaxUnauthCallback = null
App.Common =
  toModel: (x) ->
    output = @create()
    for key,value of x
      output.set key, value
    for own key, modelClass of output.get "_internalMaps"
      Em.assert "Member '#{key}' of class #{@.toString()} has undefined model class", modelClass
      Em.assert "Member '#{key}' is undefined for #{@.toString()}", "undefined" != typeof output.get(key)
      list = output.get(key)
      output.set key, list?.map(App.Common.toModel, modelClass)
    output

  setAjaxUnauthCallback: (callback) -> ajaxUnauthCallback = callback

  ajax: (options) ->
    #Override jQuery ajax to handle unauthorizised API access
    origError = options.error
    origComplete = options.complete
    newOptions = $.extend {}, options,
      error: null
      complete: null
    $.ajax(newOptions).then null, (xhr, status, error) ->
      if xhr.status == 403
        deferred = $.Deferred()
        ajaxUnauthCallback?(@, deferred)
        deferred
      else
        $.Deferred (defer) -> defer.rejectWith @, [xhr, status, error]
    .fail(-> origError?.apply @, arguments)
    .always(-> origComplete?.apply @, arguments)