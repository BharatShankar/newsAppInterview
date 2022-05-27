import 'package:flutter/material.dart';
import 'package:news_interview/bloc/news_bloc/article_bloc.dart';
import 'package:news_interview/headlines_screen.dart';
import 'package:news_interview/repositories/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialKart - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            ArticleBloc(repository: ArticleRepositoryImpl()),
        child: const HeadLinesScreen(),
      ),
    );
  }
}
