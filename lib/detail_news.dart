import 'package:flutter/material.dart';
import 'package:news_interview/models/api_model.dart';
import 'package:news_interview/strings.dart';

class DetailNewsPage extends StatelessWidget {
  Articles? article;

  DetailNewsPage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text("Flutter News App"),
      // ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: article?.urlToImage ?? '',
                  child: Container(
                    foregroundDecoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Image.network(
                      article?.urlToImage ?? '',
                      fit: BoxFit.cover,
                      // filterQuality: FilterQuality.high,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          AppStrings.noNewsImg,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //         colors: [Colors.black, Colors.grey])),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          article?.title ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          article?.publishedAt ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          article?.content ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                top: 50,
                left: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
