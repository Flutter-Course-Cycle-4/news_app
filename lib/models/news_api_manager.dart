import 'package:dio/dio.dart';
import 'package:news_app/models/source.dart';

class NewsApiManager {
  static const String _apiKey = '1b7362b6a1d9412fab451ac34f22a58c';
  static const _apiURL = 'https://newsapi.org/v2/';

  static Future<List<dynamic>> getSources(String category) async {
    String url = _apiURL + 'top-headlines/sources';
    Dio dio = Dio();
    Map<String, String> parms = {
      'apiKey': _apiKey,
      'category': category,
    };
    Response response = await dio.get(url, queryParameters: parms);
    return response.data['sources'];
  }

  static Future<List<dynamic>> getArticles(String category) async {
    String url = _apiURL + 'top-headlines';
    Dio dio = Dio();
    Map<String, String> parms = {
      'apiKey': _apiKey,
      'category': category,
    };
    Response response = await dio.get(url, queryParameters: parms);
    return response.data['articles'];
  }
}
