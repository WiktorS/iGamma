App.ExtractsTabSelectedView = Em.View.extend
  templateName: "extractsTabSelected"

  type: null
  #since render can only pass args to view - columns are defined in view
  columns: (-> @get("controller").getColumns(@get "type")).property("type", "controller.objectType")
