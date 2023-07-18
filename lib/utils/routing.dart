
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:quizme/model/quiz_model.dart';
import 'package:quizme/pages/account_screen.dart';
import 'package:quizme/pages/points_screen.dart';
import 'package:quizme/pages/quiz_screen.dart';
import 'package:quizme/pages/quiz_selection_screen.dart';


import '../../pages/splash page/splash_screen.dart';
import '../pages/Home page/home_screen.dart';

class RouteHelper{
  static const String initial="/";
  static const String signUp="/sign-up";
  static const String signIn="/sign-in";
  static const String firstOnBoarding="/first-onboarding-screen";
  static const String secondOnBoarding="/second-onboarding-screen";
  static const String homeScreen="/home-screen";
  static const String quizScreen="/quiz-screen";
  static const String applyLoan="/apply-loan";

  static const String cartPage="/cart-page";
  static const String orderToCart="/orders-cart";
  static const String proceed="/proceed";

  static const String favoritePage="/favorite-page";
  static const String orderDetails="/order-details";
  static const String points="/points";
  static const String profile="/profile";
  static const String foodScreen="/food-screen";
  static const String itemsScreen="/items-screen";
  static const String quizSelectionScreen="/quiz-selection";
  static  String getSignin()=>'$signIn';
  static  String getSignup()=>'$signUp';
  static  String getInitial()=>'$initial';
  static  String getFirstOnBoarding()=>'$firstOnBoarding';
  static  String getSecondOnBoarding()=>'$secondOnBoarding';
  static  String getHomeScreen()=>'$homeScreen';
  static  String getApplyLoan(String userEmail)=>'$applyLoan?userEmail=$userEmail';

  static  String getItems(int itemsId)=>'$itemsScreen?itemsId=$itemsId';
  static  String getQuizScreen()=>'$quizScreen';
  static  String getOrderToCart()=>'$orderToCart';
  static  String getQuizSelection()=>'$quizSelectionScreen';

  static  String getFavorite()=>'$favoritePage';

  static  String getOrdersDetails()=>'$orderDetails';
  static  String getProceedPage()=>'$proceed';
  static  String getLogOut()=>'$points';
  static  String getProfile()=>'$profile';
  static  String getFoodScreen()=>'$foodScreen';


  static List<GetPage> routes=[
    // GetPage(name: initial, page: ()=>MainFoodPage()),
    // GetPage(name: popularFood, page: ()=>PopularFoodDetail()),
    GetPage(name: initial, page: (){
      return SplashScreen();
    },

        transitionDuration:Duration(seconds: 1)

    ),
    GetPage(name: homeScreen, page: (){

      return HomeScreen();
    },
        transitionDuration:Duration(seconds: 1)


    ),

    GetPage(name: quizScreen, page: (){

      return QuizScreen();
    },
        transitionDuration:Duration(seconds: 1)


    ),

    GetPage(name: quizSelectionScreen, page: (){


      return QuizSelectionScreen();
    },

        transitionDuration: Duration(seconds: 1)

    ),



    GetPage(name:points, page: (){

      return PointsScreen();
    },
        transitionDuration:Duration(seconds: 1)


    ),
    //
    // GetPage(name:test, page: (){
    //   return Test();
    // },
    //     transitionDuration:Duration(seconds: 1)
    //
    //
    // ),
    //
    //
    // GetPage(name: firstOnBoarding, page: (){
    //   return FirstOnBoardingScreen();
    // },
    //     transitionDuration:Duration(seconds: 1)
    //
    //
    // ),
    // //
    //
    // //
    // GetPage(name: secondOnBoarding, page: (){
    //
    //   return SecondOnBoardingScreen();
    // },
    //
    //
    //     transitionDuration:Duration(seconds: 1)
    // ),
    //
    // GetPage(name: homeScreen, page: (){
    //   return HomeScreen();
    //
    // },
    //     transitionDuration:Duration(seconds: 1)
    //
    //
    // ),
    //
    // GetPage(name: favoritePage, page: (){
    //
    //   return FavoritesPage();
    // },
    //     transition: Transition.leftToRightWithFade
    // ),
    //
    GetPage(name: profile, page: (){

      return AccountScreen();
    },
        transitionDuration:Duration(seconds: 1),
        transition: Transition.rightToLeftWithFade
    ),
    // GetPage(name: signIn, page: (){
    //
    //   return SignInScreen();
    // },
    //
    //     transitionDuration:Duration(seconds: 1)
    //
    // ),
    //
    // GetPage(name: signUp, page: (){
    //
    //   return SignUpScreen();
    // },
    //
    //     transitionDuration:Duration(seconds: 1)
    //
    // )
  ];
}