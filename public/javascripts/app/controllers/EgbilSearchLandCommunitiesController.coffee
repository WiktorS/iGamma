App.EgbilSearchLandCommunitiesController = App.EgbilSearchCommonController.extend
  jsonMethod: "getLandCommunities"
  columns: [
    "check"
    "marker"
    "landCommunityName"
    "address"
  ]
  type: "landCommunities"
  title: "Zarządy wspólnot gruntowych"
