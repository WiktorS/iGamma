App.ExtractsTabGeneralController = Em.Controller.extend
  needs: ["extracts"]

  content: null

  fileFormatList: [
      Em.Object.create {value: "html", displayValue: "HTML"}
      Em.Object.create {value: "pdf", displayValue: "PDF"}
      Em.Object.create {value: "txt", displayValue: "TXT"}
    ]

  isPrg: (-> "prg" == @get "controllers.extracts.extractType").property("controllers.extracts.extractType")
  isUrg: (-> "urg" == @get "controllers.extracts.extractType").property("controllers.extracts.extractType")
  isJrb: (-> "jrb" == @get "controllers.extracts.objectType").property("controllers.extracts.objectType")
  isJrl: (-> "jrl" == @get "controllers.extracts.objectType").property("controllers.extracts.objectType")

  disableNoPersonalData: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableNoPESEL: (-> !(@get("content.shareInfo") && @get("content.noPersonalData"))).property("content.shareInfo", "content.noPersonalData")
  disableChosenShares: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableOtherCadastralUnitForPersons: (-> !@get "content.shareInfo").property("content.shareInfo")
  disableLocalIndex: (-> !@get "content.localIndexExtract").property("content.localIndexExtract")
