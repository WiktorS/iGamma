App.AccordionHeaderView = Em.View.extend
  classNames: ["accordion-heading"]
  templateName: "accordionHeader"
  label: null

  click: ->
    accordionGroup = @$().closest(".accordion-group")
    accordionBody = accordionGroup.children ".accordion-body"
    accordionBody.collapse("toggle")


App.AccordionBodyView = Em.View.extend
  classNames: ["accordion-body", "collapse", "in"]
  templateName: "accordionBody"
  content: null
  columns: null
