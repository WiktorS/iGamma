App.StandardTableCellModel = Em.Object.extend
  displayValueBinding: Ember.Binding.oneWay("value")
  value: null
  label: null
  sortable: true
  valueType: null
  viewClass: null
