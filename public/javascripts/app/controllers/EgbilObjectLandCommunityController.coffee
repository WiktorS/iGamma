App.EgbilObjectLandCommunityController = App.EgbilObjectCommonController.extend
  columnsOrder:
    landCommunity: ["landCommunity", "status", "address", "landCommunityInstitution", "remarks", "notes"]
    member: ["check", "marker", "memberPersonKind", "memberEntity", "memberAddress", "memberPeselRegon", "memberNip"]

  landCommunityColumns: (-> App.columnsData.getColumns(@get "columnsOrder.landCommunity")).property()
  memberColumns: (-> App.columnsData.getColumns(@get "columnsOrder.member")).property()
