import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel(
      {required super.id,
      required super.title,
      required super.summary,
      required super.author,
      required super.published_date,
      required super.media});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        summary: json["summary"] ?? "",
        author: json["author"] ?? "",
        published_date: json["published_date"] ?? "",
        media: json["media"] ?? "");
  }
}
