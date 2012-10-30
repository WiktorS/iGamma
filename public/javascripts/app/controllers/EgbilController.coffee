App.EgbilController = Em.Controller.extend
  objects: Em.A()

  getObject: (objectType, objectName) ->
    @objects.filterProperty("objectName", objectName).findProperty("objectType", objectType)

  showObject: (objectType, objectName) ->
    object = @getObject objectType, objectName
    @get("target").send "goToObject", object if !Em.empty object

  closeObject: (objectType, objectName) ->
    Em.assert "Cannot close object without type & name", objectType? && objectName?
    object = @getObject objectType, objectName
    if !Em.empty object
      idx = @objects.indexOf object
      @objects.removeObject object
      currentStateObjectName =  App.router.get("currentState.objectName")
      if currentStateObjectName == objectName
        if @objects.length > 0
          idx-- while idx >= @objects.length
          @get("target").send "goToObject", @objects[idx]
        else if @get("target").egbilListController.content
          @get("target").transitionTo "egbil.list"
        else
          @get("target").transitionTo "egbil.search"

  openObject: (objectType, objectName) ->
    Em.assert "Can't open object of undefined type", objectType?
    Em.assert "Can't open object of undefined name", objectName?
    object = @getObject objectType, objectName
    if Em.empty object
      $.ajax
        url: "/getEgbilObject.json"
        data:
          type: objectType
          name: objectName
        success: (data) =>
          if !Em.empty data
            content = App.EgbilObjectModel.create()
            content.person = App.Common.toModel.call(App.EgbilObjectPersonModel, data.person)
            content.institution = App.Common.toModel.call(App.EgbilObjectInstitutionModel, data.institution)
            content.group = App.Common.toModel.call(App.EgbilObjectGroupModel, data.group)
            content.landCommunity = App.Common.toModel.call(App.EgbilObjectLandCommunityModel, data.landCommunity)
            content.document = App.Common.toModel.call(App.EgbilObjectDocumentModel, data.document)
            content.registerUnit = App.Common.toModel.call(App.EgbilObjectRegisterUnitModel, data.registerUnit)
            content.shares = data.shares.map(App.Common.toModel, App.EgbilObjectShareModel)
            content.lots = data.lots.map(App.Common.toModel, App.EgbilObjectLotModel)
            content.buildings = data.buildings.map(App.Common.toModel, App.EgbilObjectBuildingModel)
            content.locals = data.locals.map(App.Common.toModel, App.EgbilObjectLocalModel)
            content.landCommunities = data.landCommunities.map(App.Common.toModel, App.EgbilObjectLandCommunitiesModel)
            content.members = data.members.map(App.Common.toModel, App.EgbilObjectMemberModel)
            content.changes = data.changes.map(App.Common.toModel, App.EgbilObjectChangeModel)
            object = Em.Object.create content,
              objectType: objectType
              objectName: objectName
              groupName: @getGroupName objectType
            @objects.addObject object
            @showObject objectType, objectName
          else
            alert "Nie znaleziono rekordu"  #TODO: Error handling
    else
      @showObject objectType, objectName

  getGroupName: (group) ->
    switch group
      when "jrgib" then "Jednostka Rejestrowa Gruntów i Budynków"
      when "jrb" then "Jednostka Rejestrowa Budynków"
      when "jrl" then "Jednostka Rejestrowa Lokali"
      when "jrg" then "Stara Jednostka Rejestrowa Gruntów"
      when "lot" then "Działka"
      when "building" then "Budynek"
      when "local" then "Lokal samodzielny"
      when "doc" then "Dokument"
      when "person" then "Osoba fizyczna"
      when "institution" then "Instytucja"
      when "group" then "Podmiot grupowy"
      when "landCommunity" then "Zarząd wspólnoty grupowej"

  rightPanelData: Em.Object.create
    jrgib: [
      { name: "Wypis pełny z RG", multiselect: true }
      { name: "Wypis uproszczony z RG", multiselect: true }
      { name: "Wypis z RB", multiselect: true }
      { name: "Wypis z KB", multiselect: true }
      { name: "Zestawienie klasoużytków", multiselect: true }
      { name: "Rozliczenie udziałów", multiselect: false }
      { name: "Raport dowolny", multiselect: true }
      { name: "Dzierżawy", multiselect: false }
    ]
    jrb: [
      { name: "Wypis z RB", multiselect: true }
      { name: "Wypis z KL", multiselect: true }
      { name: "Rozliczenie udziałów", multiselect: false }
      { name: "Lista zmian w JR", multiselect: true }
      { name: "Raport dowolny", multiselect: true }
    ]
    jrl: [
      { name: "Wypis z RL", multiselect: true }
      { name: "Rozliczenie udziałów", multiselect: false }
      { name: "Lista zmian w JR", multiselect: true }
      { name: "Raport dowolny", multiselect: true }
    ]
    jrg: [
      { name: "Wypis z RG", multiselect: true }
      { name: "Wypis z KL", multiselect: true }
      { name: "Rozliczenie udziałów", multiselect: false }
      { name: "Lista zmian w JR", multiselect: true }
      { name: "Raport dowolny", multiselect: true }
    ]
    lots: [
      { name: "Wypis pełny z RG", multiselect: true }
      { name: "Wypis uproszczony z RG", multiselect: true }
      { name: "Zestawienie klasoużytków", multiselect: true }
      { name: "Lista zmian oczekujących", multiselect: true }
      { name: "Rezerwacja numerów", multiselect: false }
      { name: "Raport dowolny", multiselect: true }
    ]
    buildings: [
      { name: "Wypis z RB", multiselect: true }
      { name: "Wypis z KL", multiselect: true }
      { name: "Rezerwacja numerów", multiselect: false }
      { name: "Raport dowolny", multiselect: true }
    ]
    locals: [
      { name: "Wypis z RL", multiselect: true}
    ]
    individuals: [
      { name: "Wypis pełny z RG" , multiselect: true}
      { name: "Wypis uproszczony z RG" , multiselect: true}
      { name: "Zestawienie klasoużytków" , multiselect: true}
      { name: "Lista zmian oczekujących" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
      { name: "Działki" , multiselect: true}
      { name: "Budynki" , multiselect: true}
      { name: "Lokale" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
    ]
    institutions: [
      { name: "Wypis pełny z RG" , multiselect: true}
      { name: "Wypis uproszczony z RG" , multiselect: true}
      { name: "Zestawienie klasoużytków" , multiselect: true}
      { name: "Lista zmian oczekujących" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
      { name: "Działki" , multiselect: true}
      { name: "Budynki" , multiselect: true}
      { name: "Lokale" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
    ]
    groups: [
      { name: "Wypis pełny z RG" , multiselect: true}
      { name: "Wypis uproszczony z RG" , multiselect: true}
      { name: "Zestawienie klasoużytków" , multiselect: true}
      { name: "Lista zmian oczekujących" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
      { name: "Działki" , multiselect: true}
      { name: "Budynki" , multiselect: true}
      { name: "Lokale" , multiselect: true}
      { name: "Raport dowolny" , multiselect: true}
    ]
    documents: [
      { name: "Skan", multiselect: false}
      { name: "Działki", multiselect: false}
      { name: "Budynki", multiselect: false}
      { name: "Lokale", multiselect: false}
      { name: "Zmiany", multiselect: false}
    ]
    changes: [
      { name: "Dokumenty", multiselect: false}
      { name: "Działki", multiselect: false}
      { name: "Zawiadomienie o zmianie", multiselect: false}
      { name: "Różnice", multiselect: false}
      { name: "Raport dowolny", multiselect: true}
    ]
