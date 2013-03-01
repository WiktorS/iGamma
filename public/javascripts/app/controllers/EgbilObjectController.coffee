App.EgbilObjectController = Em.ObjectController.extend
  content: null
  objectTypeName:
    jrg: "Jednostka Rejestrowa Gruntów i Budynków"
    jrb: "Jednostka Rejestrowa Budynków"
    jrl: "Jednostka Rejestrowa Lokali"
    oldJrg: "Stara Jednostka Rejestrowa Gruntów"
    lot: "Działka"
    building : "Budynek"
    local: "Lokal samodzielny"
    document : "Dokument"
    person : "Osoba fizyczna"
    institution: "Instytucja"
    group: "Podmiot grupowy"
    landCommunity: "Zarząd wspólnoty grupowej"

  title: (->
    objectType = @get "content._objectType"
    objectTypeName = @get "objectTypeName.#{objectType}"
    objectDescription = @get "content._objectDescription"
    "#{objectTypeName}: #{objectDescription}"    
    ).property("content._objectType", "content._objectDescription")
  rightPanelContent: (->
    data = @get ["target.egbilController.rightPanelData", @get "content._objectType"].join(".")
    ).property("content.objectType")
  rightPanelSelectedObjects: ( ->
    object = Em.Object.create @get("content"),
      selectedShares: Em.A()
      selectedLots: Em.A()
    Em.makeArray object
    ).property("content")
