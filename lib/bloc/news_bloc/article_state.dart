import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_interview/models/api_model.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ArticleLoadedState extends ArticleState {
  List<Articles>? articles;
  ArticleLoadedState({@required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ArticleOfflineState extends ArticleState {
  List<Articles>? articles;
  ArticleOfflineState({@required this.articles});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleErrorState extends ArticleState {
  String? message;
  List<Articles>? articles;
  ArticleErrorState(this.articles, {@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
