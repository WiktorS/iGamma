App.PrintsController = Em.Controller.extend
  #input
  content: null
  #DOM form to perform submit - needed to send files
  printForm: null

  disablePrint: false
  disableLoadParams: false

  router: (-> return @container.lookup("router:main")).property() #taken from ember.js LinkView

  #observers for print type dropdown combo
  _selectedPrintTypeChanged: (->
    selectedPrintType = @get "selectedPrintType"
    if !!selectedPrintType && selectedPrintType.route != @get "router.router.currentHandlerInfos.lastObject.name"
      @transitionToRoute selectedPrintType.route
    ).observes("selectedPrintType")
  _routerUrlChanged: (->
    activeRoute = @get "router.router.currentHandlerInfos.lastObject.name"
    findPrintType = (printTypes, value) ->
      for printType in printTypes
        if value == printType.get "route"
          return printType
        else if (children = printType.get "children")
          return childPrintType if (childPrintType = findPrintType children, value)
      return null
    @set "selectedPrintType", foundPrintType if (foundPrintType = findPrintType @get("printTypes"), activeRoute)
    ).observes("router.url")

  printTypes: [
    Em.Object.create
      name: "Wypisy"
      route: "extracts"
      action: "print/extracts"
      children: [
        Em.Object.create {name: "Wypis pełny z rejestru gruntów", route: "extracts.prg"}
        Em.Object.create {name: "Wypis uproszczony z rejestru gruntów", route: "extracts.urg"}
        Em.Object.create {name: "Wypis z rejestru budynków", route: "extracts.rb"}
        Em.Object.create {name: "Wypis z kartoteki budynków", route: "extracts.kb"}
        Em.Object.create {name: "Wypis z rejestru lokali ", route: "extracts.rl"}
        Em.Object.create {name: "Wypis z kartoteki lokali", route: "extracts.kl"}
      ]
    Em.Object.create
      name: "Skorowidz działek"
      route: "prints.lotIndex"
      action: "print/lotIndex"
    Em.Object.create
      name: "Skorowidze danych podmiotowych"
      route: "entityIndexes"
      action: "print/entityIndexes"
      children: [
        Em.Object.create {name: "Wykaz podmiotów", route: "entityIndexes.entitiesIndex"}
        Em.Object.create {name: "Wykaz władających", route: "entityIndexes.possesionsIndex"}
        Em.Object.create {name: "Wykaz dzierżawców", route: "entityIndexes.leasesIndex"}
        Em.Object.create {name: "Błędne udziały", route: "entityIndexes.incorrectShares"}
      ]
    Em.Object.create
      name: "Wykazy i zestawienia"
      route: "rankings"
      action: "print/rankings"
      children: [
        Em.Object.create {name: "Wykaz gruntów", route: "rankings.landsIndex"}
        Em.Object.create {name: "Wykaz budynków", route: "rankings.buildingsIndex"}
        Em.Object.create {name: "Wykaz lokali", route: "rankings.localsIndex"}
        Em.Object.create {name: "Zestawienie gruntów", route: "rankings.landsRanking"}
        Em.Object.create {name: "Zestawienie użytków", route: "rankings.terrainRanking"}
      ]
    Em.Object.create
      name: "Zawiadomienie o zmianie"
      route: "changeNotification"
      action: "print/changeNotification"
      children: [
        Em.Object.create {name: "Zawiadomienie standardowe", route: "changeNotification.standardNotification"}
        Em.Object.create {name: "Zawiadomienie podatkowe", route: "changeNotification.taxNotification"}
        Em.Object.create {name: "Klasyfikacja podatkowa użytków", route: "changeNotification.taxClassification"}
      ]
    Em.Object.create
      name: "Dziennik zgłoszeń zmian"
      route: "prints.changesApplicationReport"
      action: "print/changesApplicationReport"
    Em.Object.create
      name: "Raporty dowolne"
      route: "prints.customReport"
      action: "print/customReport"
    ]
  selectedPrintType: null

  onPrint: ->
    #assign action based on selected print type
    for printType in @get "printTypes"
      if @get("router").isActive(printType.get "route")
        action = printType.get "action"
        break
    Em.assert "No action string defined for current route", action
    params = @get("content").toParam()
    @get("router").send "printForm", params, @get("printForm"), action

  onLoadParams: ->
    debugger #TODO
