App.ExtractsTabGeneralController = Em.Controller.extend
  content: null

  fileFormatList: [
      Em.Object.create {value: "html", displayValue: "HTML"}
      Em.Object.create {value: "pdf", displayValue: "PDF"}
      Em.Object.create {value: "txt", displayValue: "TXT"}
    ]

  isPrg: (-> "prg" == @get "target.content.extractType").property("target.content.extractType")
  isUrg: (-> "urg" == @get "target.content.extractType").property("target.content.extractType")
  isJrb: (-> "jrb" == @get "target.objectType").property("target.objectType")
  isJrl: (-> "jrl" == @get "target.objectType").property("target.objectType")

  disableNoPersonalData: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableNoPESEL: (-> !(@get("content.shareInfo") && @get("content.noPersonalData"))).property("content.shareInfo", "content.noPersonalData")
  disableChosenShares: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableOtherCadastralUnitForPersons: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableLocalIndex: (-> !@get "content.localIndexExtract").property("content.localIndexExtract")
