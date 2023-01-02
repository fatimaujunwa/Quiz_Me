import 'package:get/get_connect/http/src/response/response.dart';



import 'package:quizme/api_client/api_client.dart';
import 'package:quizme/utils/app_variables.dart';




String endpoint="";
class QuizRepo{
  final ApiClient apiClient;
  QuizRepo({required this.apiClient});

Future <Response>getQuiz()async{
return await apiClient.getData('${AppVariables.BASE_URI}?amount=20&category=10&difficulty=easy&type=multiple');



}



}