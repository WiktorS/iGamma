App.EgbilSearchCommonController = Em.Controller.extend
  needs: ["egbilSearch", "gammaCache"]  #gammaCache is needed for systematics, TODO: problably this need to be changed

  content: null

  appendSearchField: (field, attrIndex) ->
    Em.assert "Field on a form must have not null definition", field
    field.set "attrIndex", attrIndex

  doSearch: ->
    type = @get "type"
    @get("controllers.egbilSearch").findObjects
      type: type
      content: @get("content")
      success: (list)=>
        @get("target").send "goToList", Em.Object.create
          type: type
          list: list
