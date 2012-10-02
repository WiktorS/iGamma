App.EgbilObjectController = Em.ObjectController.extend
  content: null
  title: (->
    groupName = @get "content.groupName"
    cadastralUnit = @get "content.registerUnit.cadastralUnit.value"
    precinct = @get "content.registerUnit.precinct.value"
    g5 = @get "content.registerUnit.g5.value"
    "#{groupName}: JE #{cadastralUnit}, Obręb #{precinct}, ID #{g5}"
    ).property("content")
