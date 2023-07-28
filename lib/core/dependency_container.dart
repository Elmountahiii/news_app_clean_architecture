import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_articles.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencyInjection() async {
  // * dio
  getIt.registerSingleton<Dio>(Dio());

  // * Dependencies

  // * Data
  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt<Dio>()));

  // * Domain
  getIt.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(getIt<NewsApiService>()));

  getIt.registerSingleton<GetArticlesUseCase>(
      GetArticlesUseCase(getIt<ArticleRepository>()));

  // * State Managements
  getIt.registerFactory(() => RemoteArticleBloc(getIt<GetArticlesUseCase>()));
}
