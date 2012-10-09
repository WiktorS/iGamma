App.EgbilObjectController = Em.ObjectController.extend
  content: null
  title: (->
    groupName = @get "content.groupName"
    cadastralUnit = @get "content.registerUnit.cadastralUnit.value"
    precinct = @get "content.registerUnit.precinct.value"
    g5 = @get "content.registerUnit.g5.value"
    "#{groupName}: JE #{cadastralUnit}, Obręb #{precinct}, ID #{g5}"
    ).property("content")
  rightPaneContent: (->
    data = @get ["rightPaneData", @get "content.objectType"].join(".")
    ).property("content.objectType")
  rightPaneData: Em.Object.create
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
