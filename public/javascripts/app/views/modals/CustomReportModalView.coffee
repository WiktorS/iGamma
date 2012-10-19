App.CustomReportModalView = App.ModalView.extend
  templateName: "customReportModal"

  attributes: null
  configurations: null

  labal: null
  precision: null
  unit: null
  sumUp: false
  dictionaryLegend: false

  attributeLegend: false
  lineBreak: null
  fileFormat: null

  selectedAttributes: (->
    Em.A()
    ).property("attributes.@each.isSelected")

  init: ->
    @_super()
    @set "attributes", Em.A()
    @set "configurations", Em.A()
    @set "labal", ""
    @set "precision", Em.A()
    @set "unit", Em.A()
    @set "lineBreak", [
      Em.Object.create {value: 0, displayValue: "brak"}
      Em.Object.create {value: 1, displayValue: "co 1 obiekt"}
      Em.Object.create {value: 5, displayValue: "co 5 obiektów"}
      Em.Object.create {value: 10, displayValue: "co 10 obiektów"}
    ]
    @set "fileFormat", [
      Em.Object.create {value: "html", displayValue: "HTML"}
      Em.Object.create {value: "cvs", displayValue: "CSV"}
    ]

  onShow: ->
    @_super()

  onAddAttribute: ->
    false

  onDelAttribute: ->
    false

  onUpAttribute: ->
    false

  onDownAttribute: ->
    false

  onSaveConfiguration: ->
    false

  onDelConfiguration: ->
    false

  onPrint: ->
    false
