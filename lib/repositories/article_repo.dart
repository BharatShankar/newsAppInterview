import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:news_interview/models/api_model.dart';
import 'package:news_interview/utils/strings.dart';

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
  Future<List<Articles>> getSavedData();
}

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse(AppStrings.url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      saveToLocalData(data);
      List<Articles>? articles = ApiResultModel.fromJson(data).articles;
      return articles ?? [];
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Articles>> getSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? newsDataStr = prefs.getString('user');
    ApiResultModel newsDataResponse =
        ApiResultModel.fromJson(jsonDecode(newsDataStr!));

    return newsDataResponse.articles ?? [];
  }

  saveToLocalData(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isResultSaved = await prefs.setString('user', jsonEncode(data));

    print("Saved data :$isResultSaved");
  }
}
