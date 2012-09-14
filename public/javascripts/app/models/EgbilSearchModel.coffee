App.EgbilSearchModel = Em.Object.extend
  registerUnit:
    jrg: App.StandardFilterElementModel.create
      label: "Numer JRG"
      name: "jrg"
    jrb: App.StandardFilterElementModel.create
      label: "Numer JRB"
      name: "jrb"
    jrl: App.StandardFilterElementModel.create
      label: "Numer JRL"
      name: "jrl"

  lot:
    number: App.StandardFilterElementModel.create
      label: "Numer działki"
      help: "[%][,]"
    area: App.StandardFilterElementModel.create
      label: "Pow. ewidencyjna"

  terrainCategory:
    identifier: App.StandardFilterElementModel.create
      label: "Oznaczenie"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia"

  building:
    number: App.StandardFilterElementModel.create
      label: "Numer budynku"
      help: "[%]"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia zabudowy"
      help: "[m2]"
      type: "range"
    type: App.StandardFilterElementModel.create
      label: "Rodzaj"
      type: "select"
    highestLevel: App.StandardFilterElementModel.create
      label: "Nr najwyższej kondygn."
      type: "range"
    lowestLevel: App.StandardFilterElementModel.create
      label: "Nr najniższej kondygn."
      type: "range"

  local:
    number: App.StandardFilterElementModel.create
      label: "Numer ewid. lokalu"
      help: "[%]"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia użytkowa"
      type: "range"
      help: "[m2]"
    type: App.StandardFilterElementModel.create
      label: "Typ lokalu"
    roomsCount: App.StandardFilterElementModel.create
      label: "Liczba izb"

  address:
    postalCode: App.StandardFilterElementModel.create
      label: "Kod pocztowy"
      help: "[%]"
    town: App.StandardFilterElementModel.create
      label: "Miejscowość"
      help: "[%]"
      type: "select"
    street: App.StandardFilterElementModel.create
      label: "Ulica"
      help: "[%]"
      type: "select"
    houseNumber: App.StandardFilterElementModel.create
      label: "Numer porządkowy"
      help: "[%]"
    flatNumber: App.StandardFilterElementModel.create
      label: "Numer lokalu"
      help: "[%]"

  signature:
    lot: App.StandardFilterElementModel.create
      label: "Dokument działki"
      help: "[%]"
    building: App.StandardFilterElementModel.create
      label: "Dokument budynku"
      help: "[%]"
    local: App.StandardFilterElementModel.create
      label: "Dokument lokalu"
      help: "[%]"

  person:
    sex: App.StandardFilterElementModel.create
      label: "Płeć"
    firstName: App.StandardFilterElementModel.create
      label: "Imię"
      help: "[%]"
    middleName: App.StandardFilterElementModel.create
      label: "Drugie imię"
      help: "[%]"
    lastName: App.StandardFilterElementModel.create
      label: "Nazwisko"
      help: "[%]"
    fatherName: App.StandardFilterElementModel.create
      label: "Imię ojca"
      help: "[%]"
    motherName: App.StandardFilterElementModel.create
      label: "Imię matki"
      help: "[%]"
    pesel: App.StandardFilterElementModel.create
      label: "PESEL"
      help: "[%]"
    document: App.StandardFilterElementModel.create
      label: "Ozn. dok. tożsamości"
      help: "[%]"
    status: App.StandardFilterElementModel.create
      label: "Status podmiotu"
    nationality: App.StandardFilterElementModel.create
      label: "Obywatelstwo"

  institution:
    shortName: App.StandardFilterElementModel.create
      label: "Nazwa skrócona"
      help: "[%]"
    fullName: App.StandardFilterElementModel.create
      label: "Nazwa pełna"
      help: "[%]"
    status: App.StandardFilterElementModel.create
      label: "Status podmiotu"
    regon: App.StandardFilterElementModel.create
      label: "REGON"
      help: "[%]"
    nip: App.StandardFilterElementModel.create
      label: "NIP"
      help: "[%]"
    registerName: App.StandardFilterElementModel.create
      label: "Nazwa rej. o. prawnych"
      help: "[%]"
    registerNumber: App.StandardFilterElementModel.create
      label: "Numer rej. o. prawnych"
      help: "[%]"
    registerCourt: App.StandardFilterElementModel.create
      label: "Nazwa sądu rej."
      help: "[%]"

  landCommunity:
    name: App.StandardFilterElementModel.create
      label: "Nazwa spółki"
      help: "[%]"

  document:
    type: App.StandardFilterElementModel.create
      label: "Rodzaj"
    signature: App.StandardFilterElementModel.create
      label: "Sygnatura"
      help: "[%]"
    source: App.StandardFilterElementModel.create
      label: "Źródło"
      help: "[%]"
    creationFromDate: App.StandardFilterElementModel.create
      label: "Data utworzenia od"
      type: "calendar"
    creationToDate: App.StandardFilterElementModel.create
      label: "Data utworzenia do"
      type: "calendar"
    receiptFromDate: App.StandardFilterElementModel.create
      label: "Data wpływu od"
      type: "calendar"
    receiptToDate: App.StandardFilterElementModel.create
      label: "Data wpływu do"
      type: "calendar"
    designation: App.StandardFilterElementModel.create
      label: "Oznaczenie"
      help: "[%]"
    description: App.StandardFilterElementModel.create
      label: "Opis"
      help: "[%]"

  relations:
    scan: App.StandardFilterElementModel.create
      label: "Skan"
      type: "select"
    lots: App.StandardFilterElementModel.create
      label: "Działki"
      type: "select"
    buildings: App.StandardFilterElementModel.create
      label: "Budynki"
      type: "select"
    locals: App.StandardFilterElementModel.create
      label: "Lokale"
      type: "select"
    changes: App.StandardFilterElementModel.create
      label: "Zmiany"
      type: "select"

  share:
    character: App.StandardFilterElementModel.create
      label: "Charakter władania"
    registerGroup: App.StandardFilterElementModel.create
      label: "Grupa rejestrowa"
    value: App.StandardFilterElementModel.create
      label: "Udział"

  flags:
    historicalEntries: App.StandardFilterElementModel.create
      label: "Uwzględnij wpisy historyczne"
      value: false
