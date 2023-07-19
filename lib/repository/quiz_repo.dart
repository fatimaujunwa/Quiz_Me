import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

import 'package:quizme/api_client/api_client.dart';
import 'package:quizme/utils/app_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

String endpoint = "";

class QuizRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  QuizRepo({required this.apiClient, required this.sharedPreferences});

  static const String _stars = 'stars';
  static const String _category = 'category';
  int _starScores = 0;
  int _addStar = 0;
  String categoryList = '';
  Map<String, int> data = {};
  String cateList = '';

  void addToStars(int stars) {
    _addStar = sharedPreferences.getInt(_stars) ?? 0;
    stars += _addStar;

    sharedPreferences.setInt(_stars, stars);
  }

  int getStars() {
    _starScores = sharedPreferences.getInt(_stars) ?? 0;

    return _starScores;
  }

  Map<String, int> getTrophy(){
 if (sharedPreferences.containsKey(_category)){
  cateList = sharedPreferences.getString(_category)!;
  Map<String, int> newData = jsonDecode(cateList)
          .map((key, value) => MapEntry(key, int.parse(value)));

  data = newData;
 }
 return data;
}

//review the map again

  void addToTrophy(Map<String, int> map) {
    if (sharedPreferences.containsKey(_category)) {
      categoryList = sharedPreferences.getString(_category)!;

      Map<String, int> data = jsonDecode(categoryList)
          .map((key, value) => MapEntry(key, int.parse(value)));

      map.addAll(data);
    }

    String jsonData = jsonEncode(map);
    sharedPreferences.setString(_category, jsonData);
  }

  
}
