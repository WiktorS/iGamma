App.LabeledClearableInputView = Em.View.extend
  templateName: "labeledClearableInput"
  tagName: "span"
  icon: "icon-upload"
  label: null
  inputId: null
  inputType: "text"
  clearable: true
#  click: (e) -> App.router.transitionTo this.get("stateName")
#  classNameBindings: ["active"]
#  active: ( -> this.get("currentStateName").match("\\."+this.get("stateName")+"(\\.|$)")!=null ).property("currentStateName", "stateName")
