App.FilterTypesView = Em.View.extend
  templateName: "filterTypes"
  currentSelection: null
  filterType: null
  enabledFilters: null
  defaultEnabledFilters: ["subject", "individual", "institution"]
  classNames: ["row", "filter-types"]
  init: ->
    @_super()
    filterTypes = Em.A()
    if !@get "filterType"
      filterTypes = Em.A @get("defaultEnabledFilters").slice()
    else
      filterTypes = Em.makeArray @get("filterType")
    filterTypes.push("advanced")
    @set "enabledFilters", Em.A(filterDescriptions[title] for title in filterTypes)
    @set "currentSelection", @get "enabledFilters.0.title"
  selectFilter: (filter) ->
    @set "currentSelection", filter.title

filterDescriptions = 
  subject:
    title: "Wybór według danych przedmiotowych"
    url: "#filter-subject"
  individual:
    title: "Wybór według osoby fizycznej"
    url: "#filter-individual"
  institution:
    title: "Wybór według instytucji / podmiotu grupowego"
    url: "#filter-institution"
  landCommunity:
    title: "Wybór według zarządu wspólnoty gruntowej"
    url: "#filter-landCommunity"
  advanced:
    prependWithDivider: true
    title: "Wybór według filtrów zaawansowanych"
    url: "#filter-advanced"
