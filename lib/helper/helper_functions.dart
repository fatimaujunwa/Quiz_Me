import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String firstname='FIRSTNAME';
  static String lastname='LASTNAME';
  static String age='AGE';
  static String email='EMAIL';
  static String isFirstName='ISFIRSTNAME';


//save username
  static Future<bool> saveAge(String fage) async {
   SharedPreferences sharedAge= Get.find<SharedPreferences>();
    return await sharedAge.setString(age, fage);
  }
  static Future<String?> getAge() async {
    SharedPreferences sharedAge= Get.find<SharedPreferences>();
    return  sharedAge.getString(age);
  }

  //save email
  static Future<bool> saveFirstName(String fname) async {
    SharedPreferences sharedFname= Get.find<SharedPreferences>();
    return await sharedFname.setString(firstname, fname);
  }
  //get name

  static Future<String?> getFirstName() async {
    SharedPreferences sharedFname= Get.find<SharedPreferences>();
    return sharedFname.getString(firstname);
  }
//save name status
  static Future<bool> saveFirstNameStatus(bool fname) async {
    SharedPreferences sharedFname= Get.find<SharedPreferences>();
    return await sharedFname.setBool(isFirstName, fname);
  }



  static Future<bool?> getFirstNameStatus() async {
    SharedPreferences sharedFname= Get.find<SharedPreferences>();
    return  sharedFname.getBool(isFirstName);
  }

//save login status
  static Future<bool> saveLastName(String lname) async {
    SharedPreferences sharedLname= Get.find<SharedPreferences>();
    return await sharedLname.setString(lastname, lname);
  }
  static Future<String?> getLastName() async {
    SharedPreferences sharedLname= Get.find<SharedPreferences>();
    return await sharedLname.getString(lastname);
  }
  static Future<bool?> saveEmail(String Email) async {
    SharedPreferences sharedEmail= Get.find<SharedPreferences>();;
    return  await sharedEmail.setString(email, Email);
  }
  static Future<String?> getEmail() async {
    SharedPreferences sharedEmail= Get.find<SharedPreferences>();;
    return  sharedEmail.getString(email);
  }


}