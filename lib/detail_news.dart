import 'package:flutter/material.dart';
import 'package:news_interview/models/api_model.dart';
import 'package:news_interview/utils/strings.dart';
import 'package:news_interview/utils/utilities.dart';

class DetailNewsPage extends StatelessWidget {
  Articles? article;

  DetailNewsPage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 64,
                        ),
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
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                article?.author ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto Slab',
                                  fontSize: 20.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Text(
                              getFormatedDate(article?.publishedAt ?? ''),
                              style: const TextStyle(
                                fontFamily: 'Roboto Slab',
                                fontSize: 20.0,
                                color: AppColors.textWhiteColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: Text(
                          article?.content ?? '',
                          style: const TextStyle(
                            fontFamily: 'Roboto Slab',
                            fontSize: 14.0,
                            color: AppColors.subTextWhiteColor,
                            fontWeight: FontWeight.normal,
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
