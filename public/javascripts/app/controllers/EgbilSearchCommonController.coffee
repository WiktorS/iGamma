App.EgbilSearchCommonController = Em.Controller.extend
  needs: ["egbilSearch", "gammaCache"]

  content: null
  searchFields: null


  init: ->
    @_super()
    @set "content", App.EgbilSearchModel.create()
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
    @get("controllers.egbilSearch").doSearch @getSearchArgsArray()
