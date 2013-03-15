App.ChangesSearchController = App.GammaSearchController.extend
  needs: ["gammaCache"]

  content: null
  type: "change"

  init: ->
    @_super()
    @set "content", App.ChangesSearchModel.create()
    @clearSearchFields()

  clearSearchFields: ->
    @set "searchFields", Em.A()

  appendSearchField: (field, attrIndex) ->
    Em.assert "Field on a form must have not null definition", field
    field.set "attrIndex", attrIndex
    @get("searchFields").pushObject field

  getSearchArgsArray: ->
    result = {}
    for field in @get "searchFields"
      name = field.get "name"
      value = field.get "value"
      attrIndex = field.get "attrIndex"
      if !Em.isEmpty(name) && !Em.isEmpty(value) && !Em.isEmpty(attrIndex)
        result[attrIndex] = { name: name, value: value }
    result

  doSearch: ->
    @findObjects @getSearchArgsArray()
