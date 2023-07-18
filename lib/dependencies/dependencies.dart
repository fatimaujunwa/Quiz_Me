import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/helper/helper_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_client/api_client.dart';
import '../controller/quiz_controller.dart';
import '../repository/quiz_repo.dart';
import '../utils/app_variables.dart';

Future<void>init(
    )async{
  //shared preferences
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppVariables.BASE_URI));

  //repositories
  Get.lazyPut(() => QuizRepo(apiClient: Get.find(),));

  Get.lazyPut(() => QuizController( repo: Get.find()));
  Get.lazyPut(() => HelperFunctions());





}