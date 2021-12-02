// *** Source -> https://rapidapi.com/contextualwebsearch/api/web-search/ ***//

class UriGenerator {
  UriGenerator._();

  static const String baseUrl = 'https://contextualwebsearch-websearch-v1.p.rapidapi.com/api';

  static const String baseUrl2 = "https://jsonplaceholder.typicode.com";

  static Uri getTrendingNews() => Uri.parse('$baseUrl/search/TrendingNewsAPI');
  // not actual news it just items with color ^^
  static Uri getSecondNews(String subUrl) => Uri.parse('$baseUrl2/photos$subUrl');
}
