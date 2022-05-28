import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_interview/bloc/news_bloc/article_bloc.dart';
import 'package:news_interview/bloc/news_bloc/article_event.dart';
import 'package:news_interview/bloc/news_bloc/article_state.dart';
import 'package:news_interview/views/detail_news.dart';
import 'package:news_interview/models/api_model.dart';
import 'package:news_interview/utils/strings.dart';
import 'package:news_interview/utils/utilities.dart';

class HeadLinesScreen extends StatefulWidget {
  const HeadLinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadLinesScreen> createState() => _HeadLinesScreenState();
}

class _HeadLinesScreenState extends State<HeadLinesScreen> {
  ArticleBloc? articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc?.add(FetchArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Center(
          child: Text(
            "HEADLINES",
            style: TextStyle(
              fontFamily: 'Roboto Slab',
              fontSize: 29.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BlocListener<ArticleBloc, ArticleState>(
        listener: (context, state) {
          if (state is ArticleErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? ''),
              ),
            );
          }
        },
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitialState) {
              return buildLoading();
            } else if (state is ArticleLoadingState) {
              return buildLoading();
            } else if (state is ArticleLoadedState) {
              return buildArticleList(state.articles ?? []);
            } else if (state is ArticleErrorState) {
              return buildArticleList(state.articles ?? []);
            }
            return Container(color: Colors.grey);
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.redAccent,
        value: 10,
      ),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Articles> articles) {
    return Container(
      color: AppColors.listviewBackGroundColor,
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: InkWell(
              child: Stack(
                children: [
                  Container(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Hero(
                          tag: articles[index].urlToImage ?? '',
                          child: Container(
                            foregroundDecoration: const BoxDecoration(
                              color: Colors.black54,
                            ),
                            child: Image.network(
                              articles[index].urlToImage ?? '',
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  AppStrings.noNewsImg,
                                  fit: BoxFit.cover,
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                articles[index].title ?? '',
                                style: const TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontFamily: 'Roboto Slab',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    articles[index].source?.name ?? '',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto Slab',
                                      fontSize: 12.0,
                                      color: AppColors.subTextWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    getFormatedDate(
                                        articles[index].publishedAt ?? ''),
                                    style: const TextStyle(
                                      fontFamily: 'Roboto Slab',
                                      fontSize: 12.0,
                                      color: AppColors.subTextWhiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              onTap: () {
                navigateToNewsDetailPage(
                  context,
                  articles[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  void navigateToNewsDetailPage(BuildContext context, Articles article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailNewsPage(
        article: article,
      );
    }));
  }
}
