import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';

import '../../../domain/entities/article.dart';
import '../../widgets/article_tail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "daily news",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(
                  article: state.articles![index],
                  onArticlePressed: (article) =>
                      _onArticlePressed(context, article),
                );
              },
              itemCount: state.articles!.length,
            );
          } else if (state is RemoteArticleError) {
            return Center(child: Text(state.exception.toString()));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {}
}
