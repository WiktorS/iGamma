App.DifferenceReportModalView = App.ModalView.extend
  templateName: "differenceReportModal"

  objectType: null
  objectName: null

  attribute: true
  registerUnit: true
  share: true
  lot: true
  building: true
  local: true

  attributeValue: ((name, value)->
    if !@get "attributeDisabled"
      @set "attribute", value if arguments.length == 2
      @get "attribute"
    ).property("attributeDisabled")
  registerUnitValue: ((name, value)->
    if !@get "registerUnitDisabled"
      @set "registerUnit", value if arguments.length == 2
      @get "registerUnit"
    ).property("registerUnitDisabled")
  shareValue: ((name, value)->
    if !@get "shareDisabled"
      @set "share", value if arguments.length == 2
      @get "share"
    ).property("shareDisabled")
  lotValue: ((name, value)->
    if !@get "lotDisabled"
      @set "lot", value if arguments.length == 2
      @get "lot"
    ).property("lotDisabled")
  buildingValue: ((name, value)->
    if !@get "buildingDisabled"
      @set "building", value if arguments.length == 2
      @get "building"
    ).property("buildingDisabled")
  localValue: ((name, value)->
    if !@get "localDisabled"
      @set "local", value if arguments.length == 2
      @get "local"
    ).property("localDisabled")

  attributeDisabled: (-> !@get "objectParams.attribute").property("objectParams")
  registerUnitDisabled: (-> !@get "objectParams.registerUnit").property("objectParams")
  shareDisabled: (-> !@get "objectParams.share").property("objectParams")
  lotDisabled: (-> !@get "objectParams.lot").property("objectParams")
  buildingDisabled: (-> !@get "objectParams.building").property("objectParams")
  localDisabled: (-> !@get "objectParams.local").property("objectParams")

  reportType: null
  reportTypeList: (->
    list = [
      Em.Object.create
        name: "full"
        title: "Raport pełny z wszystkimi obiektami"
      Em.Object.create
        name: "changes"
        title: "Raport pełny z obiektami zmienionymi"
      Em.Object.create
        name: "short"
        title: "Raport skrócony z różnicami"
    ]
    switch @get "objectType"
      when "person", "institution", "group"
        obj = list.findProperty "name", "full"
        list.removeObject obj
    list
    ).property("objectType")
  selectedReportTypeTitle: (->
    obj = @get("reportTypeList").findProperty "name", @get "reportType"
    if Em.isEmpty obj
      obj = @get "reportTypeList.0"
    obj.get "title"
    ).property("reportType")
  selectReportType: (e) ->
    @set "reportType", e.context

  objectParams: (->
      objectType = @get "objectType"
      @get "objectDefinitions.#{objectType}"
      ).property("objectType")

  objectDefinitions: Em.Object.create
    jrg: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: true
      building: true
      local: true
    jrb: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: false
      building: true
      local: false
    jrl: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: false
      building: false
      local: true
    #oldJrg?
    lot: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: true
      building: false
      local: true
    building: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: true
      building: false
      local: true
    local: Em.Object.create
      attribute: true
      registerUnit: false
      share: true
      lot: true
      building: true
      local: false
    person: Em.Object.create
      attribute: true
      registerUnit: true
      share: false
      lot: false
      building: false
      local: false
    institution: Em.Object.create
      attribute: true
      registerUnit: true
      share: false
      lot: false
      building: false
      local: false
    group: Em.Object.create
      attribute: true
      registerUnit: true
      share: false
      lot: false
      building: false
      local: false

  onPrint: ->
    reportType = @get("reportType") ? @get("reportTypeList.0.name")
    configuration = {
      reportType: reportType
      attribute: !!@get "attributeValue"
      registerUnit: !!@get "registerUnitValue"
      share: !!@get "shareValue"
      lot: !!@get "lotValue"
      building: !!@get "buildingValue"
      local: !!@get "localValue"
    }
    App.router.send "openDifferenceReport", configuration
    @hideModal()
