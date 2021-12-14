import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/news_api_manager.dart';
import 'package:news_app/models/source.dart';

class NewsProvider with ChangeNotifier {
  Source? selectedSource;

  Future<List<Source>?> getSources(String category) async {
    try {
      List<Source> sources = [];
      final sourcesAsJon = await NewsApiManager.getSources(category);
      sources = sourcesAsJon.map((e) => Source.fromJson(e)).toList();
      selectedSource = sources[0];
      notifyListeners();
      return sources;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<Article>?> getArticles(String category) async {
    try {
      List<Article> articles = [];
      final articlesAsJson = await NewsApiManager.getArticles(category);
      articlesAsJson.forEach((element) {
        if (element['description'] != null && element['urlToImage'] != null) {
          articles.add(Article.fromJson(element));
        }
      });

      List<Article> filteredArticles = articles
          .where((element) => element.source.name == selectedSource!.name)
          .toList();
      return filteredArticles;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void changeSelectedSource(Source source) {
    selectedSource = source;
    notifyListeners();
  }
}
