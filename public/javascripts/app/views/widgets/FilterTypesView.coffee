App.FilterTypesView = Em.View.extend
  templateName: "filterTypes"
  currentSelection: null
  filterType: null
  enabledFilters: null
  defaultEnabledFilters: ["subject", "individual", "institution"]
  classNames: ["row", "filter-types"]
  init: ->
    @_super()
    filterTypes = []
    if @filterType==null
      filterTypes = @defaultEnabledFilters.slice()
    else
      filterTypes = [@filterType]
    filterTypes.push("advanced")
    @enabledFilters = (filterDescriptions[title] for title in filterTypes)
    @currentSelection = @enabledFilters[0].title
  selectFilter: (event) ->
    @set "currentSelection", event.target.innerHTML

filterDescriptions = []
filterDescriptions["subject"] = {
  title: "Wybór według danych przedmiotowych"
  url: "#filter-subject"
}
filterDescriptions["individual"] = {
  title: "Wybór według osoby fizycznej"
  url: "#filter-individual"
}
filterDescriptions["institution"] = {
  title: "Wybór według instytucji / podmiotu grupowego"
  url: "#filter-institution"
}
filterDescriptions["landCommunity"] = {
  title: "Wybór według zarządu wspólnoty gruntowej"
  url: "#filter-landCommunity"
}
filterDescriptions["advanced"] = {
  prependWithDivider: true
  title: "Wybór według filtrów zaawansowanych"
  url: "#filter-advanced"
}
