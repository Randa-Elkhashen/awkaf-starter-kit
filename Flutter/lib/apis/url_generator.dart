// *** Source -> https://rapidapi.com/contextualwebsearch/api/web-search/ ***//

class UriGenerator {
  UriGenerator._();

  static const String baseUrl = 'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api';

  static Uri getTrendingNews() {
    var url = '$baseUrl/search/TrendingNewsAPI';
    return Uri.parse(url);
  }
}
