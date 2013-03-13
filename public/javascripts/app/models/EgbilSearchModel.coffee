App.EgbilSearchModel = Em.Object.extend
  systematics: App.StandardFilterElementModel.create
    label: "Systematyka"
    name: "systematics"

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
      name: "lotNumber"
    area: App.StandardFilterElementModel.create
      label: "Pow. ewidencyjna"
      name: "lotArea"

  terrainCategory:
    identifier: App.StandardFilterElementModel.create
      label: "Oznaczenie"
      name: "terrainCategoryId"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia"
      name: "terrainCategoryArea"

  building:
    number: App.StandardFilterElementModel.create
      label: "Numer budynku"
      help: "[%]"
      name: "buildingNumber"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia zabudowy"
      help: "[m2]"
      type: "range"
      name: "buildingArea"
    type: App.StandardFilterElementModel.create
      label: "Rodzaj"
      type: "select"
      name: "buildingType"
    highestLevel: App.StandardFilterElementModel.create
      label: "Nr najwyższej kondygn."
      type: "range"
      name: "buildingLevelHi"
    lowestLevel: App.StandardFilterElementModel.create
      label: "Nr najniższej kondygn."
      type: "range"
      name: "buildingLevelLo"

  local:
    number: App.StandardFilterElementModel.create
      label: "Numer ewid. lokalu"
      help: "[%]"
      name: "localNumber"
    area: App.StandardFilterElementModel.create
      label: "Powierzchnia użytkowa"
      type: "range"
      help: "[m2]"
      name: "localArea"
    type: App.StandardFilterElementModel.create
      label: "Typ lokalu"
      name: "localType"
    roomsCount: App.StandardFilterElementModel.create
      label: "Liczba izb"
      name: "localRooms"

  address:
    postalCode: App.StandardFilterElementModel.create
      label: "Kod pocztowy"
      help: "[%]"
      name: "addressPostalCode"
    town: App.StandardFilterElementModel.create
      label: "Miejscowość"
      help: "[%]"
      type: "select"
      name: "addressTown"
      dictionary: "towns"
    street: App.StandardFilterElementModel.create
      label: "Ulica"
      help: "[%]"
      type: "select"
      name: "addressStreet"
      dictionary: "streets"
    houseNumber: App.StandardFilterElementModel.create
      label: "Numer porządkowy"
      help: "[%]"
      name: "addressHouseNo"
    flatNumber: App.StandardFilterElementModel.create
      label: "Numer lokalu"
      help: "[%]"
      name: "addressFlatNo"

  signature:
    lot: App.StandardFilterElementModel.create
      label: "Dokument działki"
      help: "[%]"
      name: "signatureLot"
    building: App.StandardFilterElementModel.create
      label: "Dokument budynku"
      help: "[%]"
      name: "signatureBuilding"
    local: App.StandardFilterElementModel.create
      label: "Dokument lokalu"
      help: "[%]"
      name: "signatureLocal"

  person:
    sex: App.StandardFilterElementModel.create
      label: "Płeć"
      name: "personSex"
    firstName: App.StandardFilterElementModel.create
      label: "Imię"
      help: "[%]"
      name: "personFirstName"
    middleName: App.StandardFilterElementModel.create
      label: "Drugie imię"
      help: "[%]"
      name: "personMiddleName"
    lastName: App.StandardFilterElementModel.create
      label: "Nazwisko"
      help: "[%]"
      name: "personLastName"
    fatherName: App.StandardFilterElementModel.create
      label: "Imię ojca"
      help: "[%]"
      name: "personFatherName"
    motherName: App.StandardFilterElementModel.create
      label: "Imię matki"
      help: "[%]"
      name: "personMotherName"
    pesel: App.StandardFilterElementModel.create
      label: "PESEL"
      help: "[%]"
      name: "personPesel"
    document: App.StandardFilterElementModel.create
      label: "Ozn. dok. tożsamości"
      help: "[%]"
      name: "personDocument"
    status: App.StandardFilterElementModel.create
      label: "Status podmiotu"
      name: "personStatus"
    nationality: App.StandardFilterElementModel.create
      label: "Obywatelstwo"
      name: "personNationality"

  institution:
    shortName: App.StandardFilterElementModel.create
      label: "Nazwa skrócona"
      help: "[%]"
      name: "institutionShortName"
    fullName: App.StandardFilterElementModel.create
      label: "Nazwa pełna"
      help: "[%]"
      name: "institutionFullName"
    status: App.StandardFilterElementModel.create
      label: "Status podmiotu"
      name: "institutionStatus"
    regon: App.StandardFilterElementModel.create
      label: "REGON"
      help: "[%]"
      name: "institutionRegon"
    nip: App.StandardFilterElementModel.create
      label: "NIP"
      help: "[%]"
      name: "institutionNip"
    registerName: App.StandardFilterElementModel.create
      label: "Nazwa rej. o. prawnych"
      help: "[%]"
      name: "institutionRegisterName"
    registerNumber: App.StandardFilterElementModel.create
      label: "Numer rej. o. prawnych"
      help: "[%]"
      name: "institutionregisterNumber"
    registerCourt: App.StandardFilterElementModel.create
      label: "Nazwa sądu rej."
      help: "[%]"
      name: "institutionregisterCourt"

  landCommunity:
    name: App.StandardFilterElementModel.create
      label: "Nazwa spółki"
      help: "[%]"
      name: "landCommunityName"

  document:
    type: App.StandardFilterElementModel.create
      label: "Rodzaj"
      name: "documentType"
    signature: App.StandardFilterElementModel.create
      label: "Sygnatura"
      help: "[%]"
      name: "documentSignature"
    source: App.StandardFilterElementModel.create
      label: "Źródło"
      help: "[%]"
      name: "documentSource"
    creationFromDate: App.StandardFilterElementModel.create
      label: "Data utworzenia od"
      type: "calendar"
      name: "documentCreationDateFrom"
    creationToDate: App.StandardFilterElementModel.create
      label: "Data utworzenia do"
      type: "calendar"
      name: "documentCreationDateTo"
    receiptFromDate: App.StandardFilterElementModel.create
      label: "Data wpływu od"
      type: "calendar"
      name: "documentReceiptDateFrom"
    receiptToDate: App.StandardFilterElementModel.create
      label: "Data wpływu do"
      type: "calendar"
      name: "documentReceiptDateTo"
    designation: App.StandardFilterElementModel.create
      label: "Oznaczenie"
      help: "[%]"
      name: "documentDesignation"
    description: App.StandardFilterElementModel.create
      label: "Opis"
      help: "[%]"
      name: "documentDescription"

  relations:
    scan: App.StandardFilterElementModel.create
      label: "Skan"
      type: "select"
      name: "relationsScan"
    lots: App.StandardFilterElementModel.create
      label: "Działki"
      type: "select"
      name: "relationsLots"
    buildings: App.StandardFilterElementModel.create
      label: "Budynki"
      type: "select"
      name: "relationsBuildings"
    locals: App.StandardFilterElementModel.create
      label: "Lokale"
      type: "select"
      name: "relationsLocals"
    changes: App.StandardFilterElementModel.create
      label: "Zmiany"
      type: "select"
      name: "relationsChanges"

  share:
    character: App.StandardFilterElementModel.create
      label: "Charakter władania"
      name: "shareCharacter"
    registerGroup: App.StandardFilterElementModel.create
      label: "Grupa rejestrowa"
      name: "shareRegisterGroup"
    value: App.StandardFilterElementModel.create
      label: "Udział"
      name: "share"

  flags:
    historicalEntries: App.StandardFilterElementModel.create
      label: "Uwzględnij wpisy historyczne"
      value: false
      name: "historicalEntries"
