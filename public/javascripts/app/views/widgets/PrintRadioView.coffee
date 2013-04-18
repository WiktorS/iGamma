App.PrintRadioView = Em.View.extend
  templateName: "printRadio"

  value: null
  disabled: null
  groupName: null

  _disabled: (-> @get("disabled") || @get("parentView.disabled")).property("disabled", "parentView.disabled")
  _groupName: (-> @get("groupName") || @get("parentView.groupName")).property("groupName", "parentView.groupName")
