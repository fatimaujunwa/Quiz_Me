import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/quiz_controller.dart';
import '../repository/quiz_repo.dart';

Future<void>init(
    )async{
  //shared preferences
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //repositories
  Get.lazyPut(() => QuizRepo());

  Get.lazyPut(() => QuizController( repo: Get.find()));





}