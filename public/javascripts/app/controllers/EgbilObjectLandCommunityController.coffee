App.EgbilObjectLandCommunityController = App.GammaObjectCommonController.extend
  columnsOrder:
    landCommunity: ["landCommunity", "status", "address", "landCommunityInstitution", "remarks", "notes"]
    member: ["check", "marker", "memberPersonKind", "memberEntity", "memberAddress", "memberPeselRegon", "memberNip"]

  landCommunityColumns: (-> App.Columns.getColumns(@get "columnsOrder.landCommunity")).property()
  memberColumns: (-> App.Columns.getColumns(@get "columnsOrder.member")).property()
