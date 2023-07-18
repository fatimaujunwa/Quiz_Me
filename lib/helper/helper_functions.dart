import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/controller/quiz_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String firstname = 'FIRSTNAME';
  static String lastname = 'LASTNAME';
  static String age = 'AGE';
  static String email = 'EMAIL';
  static String isFirstName = 'ISFIRSTNAME';
  static String countOne = 'countOne';
String progress = 'progress';
String get prog=>progress;
  static String map = 'map';
  Map<String, int> newMp = {};
  List<bool> _progress = [false, false, false];
  List<bool> _results = [];
  List count = [0, 0];

//count

  Future<void> addMap(Map<String, dynamic> maps) async {
    // List<String>list=[];

    SharedPreferences mp = Get.find<SharedPreferences>();
    // list = res.map((e) => e.toString()).toList();
    mp.setStringList(
        'myMap', maps.entries.map((e) => '${e.key}:${e.value}').toList());
    //   mp.setStringList(map, res);
    //   List<String>?myList=   mp.getStringList(map);
    // myList?.forEach((element) {
    //  newMp.addAll( jsonDecode(element)) ;

    //  });
    List<String>? mapString = mp.getStringList('myMap');
    print(mapString);
    Map<String, int> mapp = Map.fromIterable(
        mapString!.map((s) => s.split(':')),
        key: (item) => item[0],
        value: (item) => int.parse(item[1]));

    print('the val');
    // if (mapp.containsValue(1)) {
    //   mapp.forEach((key, value) {
    //     count[0]++;
    //
    //   });
    //   if(count==1){
    //     print('it is 1');
    //   }
    // }

    mapp.forEach((key, value) {
      if (mapp.containsValue(1)) {
        count[0]++;
      }
      if (mapp.containsValue(5)) {
        count[1]++;
      }
    });
    if (count[0] == 1) {
     _progress[0] = true;
    }
    if (count[1] == 10) {
      _progress[1] = true;
    }
//
//
    List<String> listOfStrings = _progress.map((bool value) => value.toString()).toList();
mp.setStringList('$progress', listOfStrings);


    List<String>? stringList = mp.getStringList('$progress');

    List<bool> boolList = stringList!.map((string) => string == 'true').toList();
   Get.find<QuizController>().setResults(boolList);

    // List<bool> booleanList = stringList!.map((string) => bool.fromEnvironment(string)).toList();
    //
    // print(' bool $booleanList'); // [true, false, true]



  }

  // static Future<bool> addCountOne(int count)async{
  //   SharedPreferences countOne=Get.find<SharedPreferences>();
  //   if(countOne.containsKey('$countOne')){
  //
  //
  //
  //   }
  // }
//save username
  static Future<bool> saveAge(String fage) async {
    SharedPreferences sharedAge = Get.find<SharedPreferences>();
    return await sharedAge.setString(age, fage);
  }

  static Future<String?> getAge() async {
    SharedPreferences sharedAge = Get.find<SharedPreferences>();
    return sharedAge.getString(age);
  }

  //save email
  static Future<bool> saveFirstName(String fname) async {
    SharedPreferences sharedFname = Get.find<SharedPreferences>();
    return await sharedFname.setString(firstname, fname);
  }
  //get name

  static Future<String?> getFirstName() async {
    SharedPreferences sharedFname = Get.find<SharedPreferences>();
    return sharedFname.getString(firstname);
  }

//save name status
  static Future<bool> saveFirstNameStatus(bool fname) async {
    SharedPreferences sharedFname = Get.find<SharedPreferences>();
    return await sharedFname.setBool(isFirstName, fname);
  }

  static Future<bool?> getFirstNameStatus() async {
    SharedPreferences sharedFname = Get.find<SharedPreferences>();
    return sharedFname.getBool(isFirstName);
  }

//save login status
  static Future<bool> saveLastName(String lname) async {
    SharedPreferences sharedLname = Get.find<SharedPreferences>();
    return await sharedLname.setString(lastname, lname);
  }

  static Future<String?> getLastName() async {
    SharedPreferences sharedLname = Get.find<SharedPreferences>();
    return await sharedLname.getString(lastname);
  }

  static Future<bool?> saveEmail(String Email) async {
    SharedPreferences sharedEmail = Get.find<SharedPreferences>();
    ;
    return await sharedEmail.setString(email, Email);
  }

  static Future<String?> getEmail() async {
    SharedPreferences sharedEmail = Get.find<SharedPreferences>();
    ;
    return sharedEmail.getString(email);
  }
}
