import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:quizme/helper/helper_functions.dart';
import 'package:quizme/model/quiz_model.dart';
import 'package:quizme/pages/points_screen.dart';
import 'package:quizme/repository/quiz_repo.dart';
import 'package:quizme/utils/widgets/custom_dialogue.dart';
import 'package:quizme/utils/widgets/custom_snackbar.dart';

import '../utils/app_variables.dart';

enum Level { intermediate, beginner, advanced }

class QuizController extends GetxController implements GetxService {
  final QuizRepo repo;
  QuizController({required this.repo});
  List<Results> _quiz = [];

  List<bool> _results = [];
  List<bool> get results => _results;
  List<Results> get quiz => _quiz;
  List<Results> _category = [];
  List<Results> get category => _category;
  bool _loading = false;
  bool get loading => _loading;
  bool finished = false;
  Map<int, bool> _map = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
  };
  Map<int, bool> get map => _map;
  int _questionsClickedOn = 0;
  int get questionsClickedOn => _questionsClickedOn;
  int _correctAnswers = 0;
  int get correctAnswers => _correctAnswers;
  int _index = 0;
  int get index => _index;
  Map<String, int> _category_list = {};
  Map<String, int> get category_list => _category_list;
  int quizAnswered = 0;
  int count = 0;
  int savedCorrectAnswers = 0;
  List<String> result = [];

  int question = 0;
  Level selectedLevel = Level.intermediate;

  void setLevel(Level level) {
    selectedLevel = level;
    update();
  }

  void setResults(List<bool> res) {
    _results = res;
    update();
    print(' results $_results');
  }

  set setIndex(index) {
    question = index;
  }

  // void getIndex(int? i) {
  //   // var firstEntryWithValue = _map.keys.firstWhere((entry) => entry == false, orElse: () => 0);
  //   // print('my val $firstEntryWithValue');
  //   _index = i!;
  //   question = i;
  //   print('index q $questionIndex');
  //   // questionIndex = index;
  //   // print(_index);
  //   // print(' questionIndex $questionIndex');
  // }

  set updateIndex(int index) {
    // question = index;
    _index = index;
    print('Index first $index');
    update();
    // var firstEntryWithValue = _map.keys.firstWhere((entry) => entry == false, orElse: () => 0);
    // print('my val $firstEntryWithValue');
  }

//setters have just one parameter
  void changeMap(int i, bool val) {
    
    _map.update(i, (value) => val);
    update();
  }

void buttonClicked(int i, bool val, context){
   _questionsClickedOn++;
   if(_questionsClickedOn==map.length-1){
      
displayResult(context);
      }
      print('indee $questionsClickedOn');
  changeMap(i, val);
  update();
  updateIndex = i;
 
      

}
  void reset() {
    _map = {
      0: false,
      1: false,
      2: false,
      3: false,
      4: false,
      5: false,
      6: false,
      7: false,
      8: false,
      9: false,
    };
    _correctAnswers = 0;
    _questionsClickedOn = 0;
  }

  void showResults(context) {
    _map.forEach((key, value) {
      if (value == true) {
        count++;
      }
    });

    if (count == 10) {
      print('does not contain');
    } else {
      CustomDialogue.showCustomDialogCompleteQuiz(context,
          okBtnFunction: () {},
          text: _correctAnswers.toString(),
          subText: _questionsClickedOn.toString());
      _correctAnswers = 0;
      _questionsClickedOn = 1;
    }
  }

  void displayResult(context) {
    CustomDialogue.showCustomDialogCompleteQuiz(context,
        okBtnFunction: () {},
        text: _correctAnswers.toString(),
        subText: _questionsClickedOn.toString());
  }

  void selectAnswer(String? correctAnswer, String? selectedAnswer,
      String category, BuildContext context) {
    if (_map[_map.length - 1] == false ) {
      if (correctAnswer == selectedAnswer) {
        _correctAnswers++;
      }
      _questionsClickedOn++;
      
      question++;

      _index = question;

      changeMap(question, true);

      update();
    }
    
    
     else {
      if(_questionsClickedOn<map.length-1){
               showCustomSnackBar(
            'Please make sure to answer all questions', 'Unanswered questions');

      }
      else{
displayResult(context);
      }
      
    }

    // else {
    //   if (_map.containsValue(false) && _map[9] == true) {
    //     print(' map last${_map}');

    //     showCustomSnackBar(
    //         'Please make sure to answer all questions', 'Unanswered questions');

    //     update();
    //   }

    //   else {

    //     if (finished == false && _results.contains(true)) {
    //       CustomDialogue.showCustomDialogCompleteQuiz(context,
    //           okBtnFunction: () {},
    //           text: _correctAnswers.toString(),
    //           subText: _questionsClickedOn.toString());
    //       print('list first' + _category_list.toString());
    //       _correctAnswers = 0;
    //       _questionsClickedOn = 0;

    //      addToCategoryList(category);
    //       Navigator.push(context, MaterialPageRoute(builder: (_,){
    //         return PointsScreen();
    //       }));
    //      // if(_results.contains(true)){
    //      //   Navigator.push(context, MaterialPageRoute(builder: (_,){
    //      //     return PointsScreen();
    //      //   }));
    //      // }

    //       update();

    //       // List<dynamic> result=   _category_list.entries.map((e) {
    //       //   return e;
    //       //
    //       // }).toList();
    //       print('list' + _category_list.toString());

    //       quizAnswered = 0;
    //       finished = true;
    //     }
    //     else{

    //     }

    //   }
    // }
  }

  void addToCategoryList(String category) {
    if (_category_list.containsKey(category.substring(0, 4))) {
      _category_list.update(category.substring(0, 4), (value) {
        value++;
        return (value++);
      });
      // update();
    } else {
      _category_list.putIfAbsent(category.substring(0, 4), () => 1);
      update();
    }
    print('cate $category_list');
    HelperFunctions helperFunctions = HelperFunctions();
    helperFunctions.addMap(_category_list);
  }

  // void incrementQuestion(context, category) {
  //   if (finished == true) {
  //     showCustomSnackBar(
  //         'Please press the back button to continue with the quizes',
  //         'Go back');
  //   }
  //   _questionsClickedOn++;
  //
  //   update();
  //   if (_questionsClickedOn == 10) {
  //     finished = true;
  //     update();
  //     CustomDialogue.showCustomDialogCompleteQuiz(context,
  //         okBtnFunction: () {},
  //         text: _correctAnswers.toString(),
  //         subText: _questionsClickedOn.toString());
  //     addToCategoryList(category);
  //     print('list incre' + _category_list.toString());
  //   }
  // }

  Future<void> getQuizLevel(String level, int category) async {
    _loading = true;
    update();
    Response response = await get(Uri.parse(
        '${AppVariables.BASE_URI}?amount=10&category=${category}&difficulty=${level}&type=multiple'));
    if (response.statusCode == 200) {
      _loading = false;
      update();

      Map<String, dynamic> map = jsonDecode(response.body);
      List results = map["results"];
      print(results[0]);
      _category = results.map((e) => Results.fromJson(e)).toList();
      update();
    }
  }

  Future<List<Results>> getQuiz() async {
    Response response =
        await get(Uri.parse('${AppVariables.BASE_URI}?amount=20'));
    if (response.statusCode == 200) {
      _quiz = [];
      Map<String, dynamic> map = jsonDecode(response.body);
      List results = map["results"];

      print(results);
      _quiz = results.map((e) => Results.fromJson(e)).toList();

      update();

      return _quiz;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
