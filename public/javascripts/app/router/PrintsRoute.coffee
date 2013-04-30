PrintsRoute = App.Route.extend
  setupController: (controller, context) -> @controllerFor("prints").set "content", context

App.PrintsRoute = App.Route.extend
  defaultRoute: "extracts"

App.ExtractsRoute = PrintsRoute.extend
  defaultRoute: "extracts.prg"
  model: -> App.PrintExtractsModel.create()

App.PrintsLotIndexRoute = PrintsRoute.extend
  model: -> App.PrintLotIndexModel.create()

App.EntityIndexesRoute = PrintsRoute.extend
  defaultRoute: "entityIndexes.entities"
  model: -> App.PrintEntityIndexesModel.create()

App.RankingsRoute = PrintsRoute.extend
  model: -> App.PrintRankingsModel.create()

RankingsCommonRoute = App.Route.extend
  model: -> @modelFor "rankings"
App.RankingsLandsIndexRoute = RankingsCommonRoute.extend()
App.RankingsBuildingsIndexRoute = RankingsCommonRoute.extend()
App.RankingsLocalsIndexRoute = RankingsCommonRoute.extend()
App.RankingsLandsRankingRoute = RankingsCommonRoute.extend()
App.RankingsTerrainRankingRoute = RankingsCommonRoute.extend()

App.ChangeNotificationRoute = PrintsRoute.extend
  model: -> App.PrintChangeNotificationModel.create()

App.PrintsChangesApplicationReportRoute = PrintsRoute.extend
  model: -> App.PrintChangesApplicationReportModel.create()

App.PrintsCustomReportRoute = PrintsRoute.extend
  model: -> App.PrintCustomReportModel.create()
