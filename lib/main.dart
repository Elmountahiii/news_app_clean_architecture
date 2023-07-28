import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/core/dependency_container.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/home/home.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  await setUpDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final articlesBloc = GetIt.instance<RemoteArticleBloc>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routes: {
        "/": (context) => BlocProvider.value(
              value: articlesBloc..add(const GetArticles()),
              child: const HomePage(),
            )
      },
    );
  }
}
