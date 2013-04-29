App.ChangesSearchController = App.GammaSearchController.extend
  needs: ["gammaCache"] #gammaCache is needed for systematics, TODO: probably this need to be changed

  content: null

  appendSearchField: (field, attrIndex) ->
    Em.assert "Field on a form must have not null definition", field
    field.set "attrIndex", attrIndex

  doSearch: ->
    @findObjects
      type: "change"
      content: @get("content")
      success: (list)=>
        @get("target").send "goToList", Em.Object.create
          type: "change"
          list: list
