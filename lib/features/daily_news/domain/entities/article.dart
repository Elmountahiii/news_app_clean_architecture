// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? id, title, summary, author, published_date, media;

  ArticleEntity({
    required this.id,
    required this.title,
    required this.summary,
    required this.author,
    required this.published_date,
    required this.media,
  });

  @override
  List<Object?> get props =>
      [id, title, author, published_date, media, summary];
}
