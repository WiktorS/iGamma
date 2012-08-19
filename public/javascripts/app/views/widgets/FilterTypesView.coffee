App.FilterTypesView = Em.View.extend
  templateName: "filterTypes"
  currentSelection: null
  enabledFilters: null
  defaultEnabledFilters: ["subject", "individual", "institution", "advanced"]
  init: ->
    @_super()
    if @enabledFilters==null
      @set "enabledFilters", @defaultEnabledFilters
    @set "enabledFilters", (filterDescriptions[title] for title in @enabledFilters)
    @set "currentSelection", @enabledFilters[0].title
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
filterDescriptions["communityLand"] = {
  title: "Wybór według zarządu wspólnoty gruntowej"
  url: "#filter-communityLand"
}
filterDescriptions["advanced"] = {
  prependWithDivider: true
  title: "Wybór według filtrów zaawansowanych"
  url: "#filter-advanced"
}
