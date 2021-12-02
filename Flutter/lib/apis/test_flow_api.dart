import 'dart:convert';

import 'package:flutter_app/apis/url_generator.dart';
import 'package:http/http.dart' as http;

class TestFlowApi {
  static TestFlowApi? _instance;

  static TestFlowApi getInstance() {
    if (_instance == null) {
      _instance = TestFlowApi();
    }
    return _instance!;
  }

  var headers = {
    'x-rapidapi-host': 'contextualwebsearch-websearch-v1.p.rapidapi.com',
    'x-rapidapi-key': '10aef24fa7msh0f09c5f854af39cp158c53jsn5ac5fb4c812a'
  };
  Future<dynamic> getTrendingNews() async {
    var uri = UriGenerator.getTrendingNews();
    http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result['value'] ?? [];
    } else if (response.statusCode == 404) {
      throw Exception('Not Found 404');
    } else {
      throw Exception('cant getTrendingNews  ${response.statusCode} $uri');
    }
  }
}
