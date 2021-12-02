import 'dart:convert';

import 'package:flutter_app/apis/news_api.dart';
import 'package:flutter_app/apis/url_generator.dart';
import 'package:flutter_app/enums/request_status.dart';
import 'package:flutter_app/view_models/app_response.dart';
import 'package:flutter_app/view_models/search/topic_search.dart';
import 'package:flutter_app/view_models/topic.dart';

class NewsController{
  NewsController._();

  static const int _itemsNumber = 10;

  static Future<AppResponse> getNews({
    required int length,
    required TopicSearch search,
  }) async {

    try {
      Uri _url = UriGenerator.getSecondNews(
          (search.id == null? "" : "/${search.id}")
          + "?_start=$length&_limit=10"
          + search.toSearchString());
      AppResponse<String> _response = await NewsApi.getNews(url: _url);

      if(_response.status == RequestStatus.success){
        // client's request was successfully received
        List<Topic> _page = [];
        if(search.id != null){
          _page.add(Topic.fromJson(json.decode(_response.data!)));
        }else{
          List _pageList = json.decode(_response.data!);
          _page = _pageList.map((topic) => Topic.fromJson(topic)).toList();
        }

        return AppResponse<List<Topic>>(
          data: _page,
          status: _response.status,
          next: _page.length >= _itemsNumber
        );
      } else {
        return AppResponse(
          status: _response.status,
        );
      }
    } on Exception catch (_) {
      return AppResponse(
        status: RequestStatus.exception,
      );
    }
  }
}