import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:quizme/api_client/api_client.dart';
import 'package:quizme/pages/Home%20page/home_screen.dart';
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
 
  String mapkey = '';
  String categoryList = '';
  Map<String, bool> data = {};

  String cateList = '';


  void addToStars(int stars) {
    _addStar = sharedPreferences.getInt(_stars) ?? 0;
    stars += _addStar;

    sharedPreferences.setInt(_stars, stars);
  }

  int getStars() {
    _starScores = sharedPreferences.getInt(_stars) ?? 0;
    print(_starScores.toString() + 'scores');

    return _starScores;
  }

  Map<String, bool> getTrophy() {
    if (sharedPreferences.containsKey(_category)) {
      cateList = sharedPreferences.getString(_category)!;
      Map<dynamic, dynamic> jsonList = jsonDecode(cateList);
      // .map((key, value) => MapEntry(key, value as int));
      Map<String, int> newData = Map<String, int>();
      jsonList.forEach((key, value) {
        newData[key.toString()] = value as int;
      });

      data = trophyWins(newData);
    }

    print('data $data');
    return data;
  }

  Map<String, bool> trophyMap = {};
  Map<String, bool> trophyWins(Map<String, int> map) {
    List vals = map.values.toList();

    if(vals.length==72){
      bool containsOnes = vals.every((element){
        print(element as int);
        return  element >= 1;

      });

      bool containsFives = vals.every((element) => element >= 5);
      if (containsOnes) {
        trophyMap.putIfAbsent('One of each', () => true);
      }
      if (containsFives) {
        trophyMap.putIfAbsent('Five of each', () => true);
      }
    }



    map.forEach((key, value) {
      if (value >= 5) {
        trophyMap.putIfAbsent(key, () => true);
      }
    });

    return trophyMap;
  }

//review the map again

  Map<String, int> newData = Map<String, int>();
  void addToTrophy(Map<String, int> map) {
    if (sharedPreferences.containsKey(_category)) {
      categoryList = sharedPreferences.getString(_category)!;

      Map<dynamic, dynamic> data = jsonDecode(categoryList);

      data.forEach((key, value) {
        newData[key.toString()] = value as int;
      });

      mapkey = map.keys.first;

      if (newData.containsKey(mapkey)) {
        int prev = newData[mapkey]!;
        int updated = prev + map[mapkey]!;
        newData[mapkey] = updated;
      } else {
        newData.addAll(map);
      }
    }

    print('mpp $newData');

    String jsonData = jsonEncode(newData);
    sharedPreferences.setString(_category, jsonData);
  }
}
