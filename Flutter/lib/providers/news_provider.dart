
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/managers/request_status_controller.dart';
import 'package:flutter_app/controllers/news_controller.dart';
import 'package:flutter_app/enums/request_status.dart';
import 'package:flutter_app/view_models/app_response.dart';
import 'package:flutter_app/view_models/search/topic_search.dart';
import 'package:flutter_app/view_models/topic.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewsProvider extends ChangeNotifier{

  // number of items call in each request
  final pageItemNumber = 10;

  RequestStatus? _state;
  RequestStatus? get state => _state;

  // true if there is next page in news list and false if not
  bool _nextPage = true;
  bool get nextPage => _nextPage;

  // will contain topics list
  List<Topic> _news = [];
  List<Topic> get news => _news;

  // when news loading _loading = true else false
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  TopicSearch search = TopicSearch();

  Future<RequestStatus> getNews ({bool reset = false}) async {
    if(_isLoading == true)
      return RequestStatus.informational;
    _isLoading = true;
    AppResponse _response = await NewsController.getNews(
        length: reset ? 0 : _news.length,
        search: search
    );
    _state = _response.status;
    switch(_response.status){
      case RequestStatus.success:
        if(reset){
          _news.clear();
        }
        _news.addAll(_response.data as List<Topic>);
        _nextPage = _response.next;
        break;
      default:
        if(_news.isEmpty || reset)
          break;
        Fluttertoast.showToast(
            msg: RequestStatusController.getStatusMessage(
                status: _response.status)
        );
        break;
    }
    _isLoading = false;
    notifyListeners();
    return _response.status;
  }
}