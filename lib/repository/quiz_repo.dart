import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as res;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart';




String endpoint="https://opentdb.com/api.php?amount=20&category=10&difficulty=easy&type=multiple";
class QuizRepo{
Future<void> getQuiz()async{
  res.Response response=await get(Uri.parse(endpoint));
if(response.statusCode==200){
  print(response);
    }


}



}