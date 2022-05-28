import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_interview/bloc/news_bloc/article_event.dart';
import 'package:news_interview/bloc/news_bloc/article_state.dart';
import 'package:news_interview/models/api_model.dart';
import 'package:news_interview/repositories/article_repo.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepository? repository;

  ArticleBloc({@required this.repository}) : super(ArticleInitialState());

  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticleEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles>? articles = await repository?.getArticles();
        yield ArticleLoadedState(articles: articles ?? []);
      } catch (e) {
        List<Articles>? articles = await repository?.getSavedData();
        yield ArticleErrorState(articles ?? [], message: e.toString());
      }
    }
  }
}
