import 'package:flutter/material.dart';

class AppStrings {
  static String apiKey = "c9be829b24324127a8f35053d445ed22";
  static String url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
  static String noNewsImg = "images/no_news.jpeg";
}

class AppColors {
  static const Color listviewBackGroundColor = Color(0xff464646);
  static const Color textWhiteColor = Color(0xfff2f2f2);
}
