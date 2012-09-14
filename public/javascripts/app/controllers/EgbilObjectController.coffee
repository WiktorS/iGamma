App.EgbilObjectController = Em.ObjectController.extend
  title: (->
    "<Nazwa grupy>: JE <Opis jednostki ewidencyjnej>, Obręb <Nazwa Obrębu> - <Opis Obrębu>, ID <Identyfikator G5>"  #TODO: data source?
    ).property()

App.EgbilObjectInfo = Em.Object.extend
  type: null
  name: null
  content: null
