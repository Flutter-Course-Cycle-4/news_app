import 'package:news_app/models/source.dart';

class Article {
  final Source source;
  final String title, url, imageUrl;
  final String? description;
  final DateTime publishedAt;

  Article(this.source, this.title, this.description, this.url, this.imageUrl,
      this.publishedAt);

  Article.fromJson(Map<String, Object?> json)
      : this(
          Source.fromJson(json['source'] as Map<String, Object?>),
          json['title']! as String,
          json['description'] as String?,
          json['url']! as String,
          json['urlToImage']! as String,
          DateTime.parse(json['publishedAt']! as String),
        );
}
