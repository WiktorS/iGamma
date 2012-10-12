App.StandardTableCellModel = Em.Object.extend
  displayValue: (-> @get "value").property("value")
  value: null
  label: null
  sortable: true
  valueType: null
  viewClass: null

  objectType: (-> @get "valueType").property("valueType")
  objectName: (-> @get "value").property("value")
