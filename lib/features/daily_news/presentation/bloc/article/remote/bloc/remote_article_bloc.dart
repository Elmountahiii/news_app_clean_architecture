import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_articles.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase _articlesUseCase;
  RemoteArticleBloc(this._articlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(getArticles);
  }

  void getArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty || emit.isDone) {
      emit(RemoteArticlesDone(dataState.data!));
    } else if (dataState is DataFailed || !emit.isDone) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
