import 'package:flutter_app/apis/test_flow_api.dart';
import 'package:flutter_app/app_helpers/app_logger.dart';
import 'package:flutter_app/view_models/news_view_model.dart';

class TestFlowController {
  static const NAME = 'TestFlowController';
  static TestFlowController? _instance;

  static TestFlowController getInstance() {
    if (_instance == null) {
      _instance = TestFlowController();
    }
    return _instance!;
  }

  // APIS
  var _testFlowApi = TestFlowApi.getInstance();

  Future<List<NewsViewModel>> getTrendingNews() async {
    try {
      List<NewsViewModel> trendingNews = [];
      var allNews = await _testFlowApi.getTrendingNews();
      for (var news in allNews) trendingNews.add(NewsViewModel.fromJson(news));
      return trendingNews;
    } catch (error, stackTrace) {
      AppLogger.logErrorToConsole(NAME, error, stackTrace, functionName: 'getTrendingNews');
      return [];
    }
  }
}
