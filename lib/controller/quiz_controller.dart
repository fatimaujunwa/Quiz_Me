


import 'dart:convert';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:quizme/model/quiz_model.dart';
import 'package:quizme/repository/quiz_repo.dart';

import '../utils/app_variables.dart';

class QuizController extends GetxController implements GetxService {
final QuizRepo repo;
QuizController({required this.repo});
List<Results> _quiz=[];
List<Results> get quiz=>_quiz;


Future<List<Results>>getQuiz()async {
 Response response=await get(Uri.parse('${AppVariables.BASE_URI}?amount=20&category=10&difficulty=easy&type=multiple'));
 if(response.statusCode==200){
Map<String, dynamic>map=jsonDecode(response.body);
List results=map["results"];
print(results[0]);
_quiz=results.map((e) => Results.fromJson(e)).toList();
return _quiz;
    }
 else{
   throw Exception(response.reasonPhrase);
 }





  }





}