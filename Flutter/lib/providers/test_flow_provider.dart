import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/test_flow_controller.dart';
import 'package:flutter_app/view_models/news_view_model.dart';

class TestFlowProvider with ChangeNotifier {
  static const NAME = 'TestFlowProvider';
  // Listeners
  List<NewsViewModel> trendingNews = [];
  bool getTrendingNewsLoading = false;

  // Controllers
  var _testFlowController = TestFlowController.getInstance();
  // Actions
  Future<void> getTrendingNews() async {
    getTrendingNewsLoading = true;
    notifyListeners();
    trendingNews = await _testFlowController.getTrendingNews();
    getTrendingNewsLoading = false;
    notifyListeners();
  }
}
