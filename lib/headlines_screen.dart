import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_interview/bloc/news_bloc/article_bloc.dart';
import 'package:news_interview/bloc/news_bloc/article_event.dart';

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c9be829b24324127a8f35053d445ed22

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
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black.withAlpha(200),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   width: 2.0
                              // ),
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      10.0) //                 <--- border radius here
                                  ),
                            ),
                            width: MediaQuery.of(context).size.width - 20,
                            child: Column(
                              children: const [
                                Text(
                                  "this is headlines of news this is headlines of news  this is headlines of news this is headlines of news this is headlines of news ",
                                  style: TextStyle(
                                    fontFamily: 'Roboto Slab',
                                    fontSize: 19.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
