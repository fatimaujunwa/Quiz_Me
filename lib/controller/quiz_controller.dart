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
  Map<String, int> categoryMap = {};

  List<bool> _results = [];
  List<bool> get results => _results;
  List<Results> get quiz => _quiz;
  List<Results> _category = [];
  List<Results> get cat => _category;
  bool _loading = false;
  int stars = 0;
  bool get loading => _loading;
  bool finished = false;

  Map<int, bool> get map => _map;
  int _questionsClickedOn = 0;
  int get questionsClickedOn => _questionsClickedOn;
  int _score = 0;
  int get score => _score;
  int _index = 0;
  int get index => _index;
  Map<String, int> _category_list = {};
  Map<String, int> get category_list => _category_list;
  int quizAnswered = 0;
  int count = 0;
  bool _displayed = false;
  int element = 0;
  int challenges = 74;

  int savedCorrectAnswers = 0;
  List<String> result = [];

  int question = 0;
  Level selectedLevel = Level.intermediate;


  Map<String, int> categories = {
    'General Knowledge':9,
    'Books':10,
    'Film':11,
    'Music':12,

    'Television':14,
    'Video Games':15,
    'Board Games':16,
    'Science & Nature':17,
    'Science: Computers':18,
    'Science: Mathematics':19,
    'Mythology':20,
    'Sports':21,
    'Geography':22,
    'History':23,

    'Celebrities':26,
    'Animals':27,
    'Vehicles':28,
    'Comics':29,

    'Japanese Anime & Manga':31,
    'Cartoon and Animations':32

  };

  List<String> categoryNames(){

    return categories.keys.toList();

  }



  static List category = [
    'General Knowledge',
    'Books',
    'Film',
    'Music',
    'Musicals & Theatres',
    'Television',
    'Video Games',
    'Board Games',
    'Science & Nature',
    'Science: Computers',
    'Science: Mathematics,',
    'Mythology',
    'Sports',
    'Geography',
    'History',
    'Politics',
    'Arts',
    'Celebrities',
    'Animals',
    'Vehicles',
    'Comics',
    'Gadgets',
    'Japanese Anime & Manga ',
    'Cartoon and Animations'
  ];


 set setLevel(Level level) {
    selectedLevel = level;
    update();
  }

  void setResults(List<bool> res) {
    _results = res;
    update();
  }

  set setIndex(index) {
    question = index;
  }

  set setDisplayed(bool displayed) {
    _displayed = displayed;
  }

  set updateIndex(int index) {
    _index = index;

    update();
  }

  // ignore: prefer_for_elements_to_map_fromiterable
  Map<int, bool> _map = Map.fromIterable(
    Iterable.generate(9, (index) => index),
    key: (element) => element,
    value: (element) => false,
  );

//setters have just one parameter
  void changeMap(int i, bool val) {
    _map.update(i, (value) => val);
    update();
  }

  void buttonClicked(int i, bool val, context, String category, String level) {
    _questionsClickedOn++;
    if (_questionsClickedOn == map.length - 1) {
      if (_displayed != true) {
        displayResult(context);
        addMapToShared(category, context, level);
      }
    }

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
    _score = 0;
    _questionsClickedOn = 0;
  }

  void showResults(context) {
    _map.forEach((key, value) {
      if (value == true) {
        count++;
      }
    });

    if (count == 10) {
    } else {
      CustomDialogue.showCustomDialogCompleteQuiz(context,
          okBtnFunction: () {},
          text: _score.toString(),
          subText: _questionsClickedOn.toString());
      _score = 0;
      _questionsClickedOn = 1;
    }
  }

  Map<String, bool> getTrophy() {
    return repo.getTrophy();
  }

  int getStars() {
    return repo.getStars();
  }

  void displayResult(context) {
    CustomDialogue.showCustomDialogCompleteQuiz(context,
        okBtnFunction: () {},
        text: _score.toString(),
        subText: _questionsClickedOn.toString());

    _displayed = true;

    update();
  }

  void findNearest(Map<int, bool> map, bool find, number) {
    question = number;
    int j = question + 1;

    while (question != j) {
      if (map[j] == find) {
        question = j;
        
      } else {
        j += 1;
      }
    }

    update();
  }

  void selectAnswer(String? correctAnswer, String? selectedAnswer,
      String category, BuildContext context, String level) {
    if (_map[_map.length - 1] == false) {
      if (correctAnswer == selectedAnswer) {
        _score++;
      }
      findNearest(_map, false, question);
      _questionsClickedOn++;

      _index = question;

      changeMap(question, true);

      update();
    } else {
      if (_questionsClickedOn < map.length - 1) {
        showCustomSnackBar(
            'Please make sure to answer all questions', 'Unanswered questions');
      } else {
        if (_score >= _questionsClickedOn) {
          stars=1;
          repo.addToStars(stars);
        }

        if (_displayed != true) {
          displayResult(context);
          addMapToShared(category, context, level);
        }
      }
    }
  }


static const Levels = ['easy', 'medium', 'hard'];
  Map<String, bool> challenge = {};

  void testing(){
    for(String element in category){
      for (String level in Levels){
       print('$element $level');
      }
    }
  }
  //challenges
 List<bool> challengeList(){



    List <bool> userChallenges = getTrophy().values.toList();
    List<String> quiztype = getTrophy().keys.toList();
    List<bool>generalChallenges= List.filled(challenges, false,growable: true);

    for(int i =0; i<userChallenges.length; i++){
      if (userChallenges[i]==true){
        generalChallenges[i]=true;
      }
    }

    return generalChallenges;


  }

  void addMapToShared(category, context, level) {
    categoryMap.putIfAbsent('$category $level', () => 1);
    repo.addToTrophy(categoryMap);
    categoryMap.clear();
  }

  void addToCategoryList(String category) {
    if (_category_list.containsKey(category.substring(0, 4))) {
      _category_list.update(category.substring(0, 4), (value) {
        value++;
        return (value++);
      });
    
    } else {
      _category_list.putIfAbsent(category.substring(0, 4), () => 1);
      update();
    }
   
    HelperFunctions helperFunctions = HelperFunctions();
    helperFunctions.addMap(_category_list);
  }

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

     
      _quiz = results.map((e) => Results.fromJson(e)).toList();

      update();

      return _quiz;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
