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
    List category=['General Knowledge','Books','Film','Music','Musicals & Theatres','Television','Video Games', 'Board Games','Science & Nature','Science: Computers',
    'Science: Mathematics,', 'Mythology','Sports','Geography','History','Politics','Arts','Celebrities','Animals','Vehicles','Comics','Gadgets','Japanese Anime & Manga ','Cartoon and Animations'];
  String mapkey = '';
  String categoryList = '';
  Map<String, bool> data = {};
  int _count = 0;
  String cateList = '';
  List count = [];

  void addToStars(int stars) {
    _addStar = sharedPreferences.getInt(_stars) ?? 0;
    stars += _addStar;

    sharedPreferences.setInt(_stars, stars);
  }
  
  int getStars() {
    _starScores = sharedPreferences.getInt(_stars) ?? 0;
    print(_starScores.toString()+'scores');


    return _starScores;
  }

  Map<String, bool> getTrophy(){
 if (sharedPreferences.containsKey(_category)){
  cateList = sharedPreferences.getString(_category)!;
  Map<dynamic, dynamic> jsonList = jsonDecode(cateList);
          // .map((key, value) => MapEntry(key, value as int));
  Map<String, int> newData =   Map<String, int>();
  jsonList.forEach((key, value) {
    newData[key.toString()] = value as int;
    
    }
    
    );


  data = trophyWins(newData);
 }
 return data;
}



Map<String, bool> trophyMap ={};
Map<String, bool> trophyWins(Map<String, int> map){
  for (var i = 0; i < 24; i++) {
    count[i] = 0;
    
  }
  map.forEach((key, value) {
    if (value == 1){
      count[0]++;
    }
    if (value==5){
      count[1]++;
    }
    // if (map.containsKey('General Knowlege'))





  });

  if (count[0] == 24){ // make this 24 dynamic
    trophyMap.putIfAbsent('first trophy', () => true);
  }
   if (count[1] == 24){ // make this 24 dynamic
    trophyMap.putIfAbsent('second trophy', () => true);
  }



  return trophyMap;
}

//review the map again

Map<String, int> newData = Map<String, int>() ;
  void addToTrophy(Map<String, int> map) {
    if (sharedPreferences.containsKey(_category)) {
      categoryList = sharedPreferences.getString(_category)!;

      Map<dynamic, dynamic> data = jsonDecode(categoryList);
  
  data.forEach((key, value) {
    newData[key.toString()] = value as int;
    
    });
      
    mapkey =  map.keys.first;

    if (newData.containsKey(mapkey)){
      int prev = newData[mapkey]!;
          int updated =  prev + map[mapkey] !;
          newData[mapkey] = updated; 

    }
    else{
      newData.addAll(map);
    }
          


      
    }

    print('mpp $newData');

    String jsonData = jsonEncode(newData);
    sharedPreferences.setString(_category, jsonData);
  }

  
}
