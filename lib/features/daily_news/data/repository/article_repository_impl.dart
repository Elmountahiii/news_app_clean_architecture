// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  var logger = Logger();

  ArticleRepositoryImpl(
    this._newsApiService,
  );

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse =
          await _newsApiService.getNewsArticles(countries: "MA");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        logger.d(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusCode,
            response: httpResponse.response,
            message: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }
}
