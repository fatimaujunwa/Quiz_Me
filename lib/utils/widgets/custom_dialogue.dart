import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/controller/quiz_controller.dart';
import 'package:quizme/pages/account_screen.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/routing.dart';
import 'package:quizme/utils/text_dimensions.dart';


class CustomDialogue {
  static CustomDialogue _instance = new CustomDialogue.internal();

  CustomDialogue.internal();

  factory CustomDialogue() => _instance;

  static void showCustomDialog(BuildContext context,
      {
        String okBtnText = "Yes",
        String cancelBtnText = "Cancel",
        String text='',
        String subText='',
        bool approved=true,
        required Function() okBtnFunction,
        required int category,


      }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
           
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content:
                GetBuilder<QuizController>(builder: (controller){
                 return   Column(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     SizedBox(height: 36.52.h,),
                     Row(children: [
                       Text('Hi',style: TextDimensions.style36joseW300Grey,),
                       Image.asset("images/image 1.png",height: 44.98.h,width: 59.07.w,)
                     ],),

                     Text('Choose your skill level?',
                       style: TextDimensions.style36joseW600Grey,

                     ),
                     SizedBox(height: 24.h,),
                     LevelWidget(text: '15 Available quizzes',level: 'easy', l: Level.beginner,cat: category, tap: () {
                       Get.find<QuizController>().getQuizLevel('easy',category).then((value) => Get.toNamed(RouteHelper.getQuizSelection()));
                       controller.setLevel(Level.beginner);

                     },),
                     SizedBox(height: 10.h,),
                     LevelWidget(text: '10 Available quizzes',level: 'medium', l: Level.intermediate,cat: category, tap: () {
                      controller.setLevel(Level.intermediate);
                      Get.find<QuizController>().getQuizLevel('medium',category).then((value) => Get.toNamed(RouteHelper.getQuizSelection()));

                     },),
                     SizedBox(height: 10.h,),
                     LevelWidget(text: '5 Available quizzes',level: 'hard', l: Level.advanced,cat: category, tap: () {
                       controller.setLevel(Level.advanced);
                       Get.find<QuizController>().getQuizLevel('hard',category).then((value) => Get.toNamed(RouteHelper.getQuizSelection()));
                     },),
                     SizedBox(height: 24.51.h,),
                     Container(
                       padding: EdgeInsets.only(left:16.w),
                       height: 150.h,width: 499.w,

                       decoration: BoxDecoration(
                         color: Color(0xffF5E9E2),
                         borderRadius: BorderRadius.circular(16.r),

                       ),

                       child: Row(


                         children: [
                           Image.asset('images/Vector-3.png',height: 24.22.h,width: 24.22.w,),
                           SizedBox(width: 10.w,),
                           Container(

                               height: 114.h,
                               width: 215.48.w,

                               child: Text('The skill level choosen determines how complex the questions would be. Take your time as the questions aren’t timed as you are can view the answers to the questions as you go.',
                                 style: TextDimensions.style16joseW400Black,)),




                         ],),
                     ),
                     SizedBox(height: 40.h,),

                   ],
                 );
                }),

            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(

                  alignment: Alignment.center,
                  height: 52.h,
                  width: 135.w,
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16.r)

                  ),
                  child: Text('Continue',style: TextDimensions.style16joseW600White,),

                ),
              ),

            ],
          );
        });
  }



  static void showCustomDialogCompleteQuiz(BuildContext context,
      {
        String okBtnText = "Yes",
        String cancelBtnText = "Cancel",
        String text='',
        String subText='',

        bool approved=true,
        required Function() okBtnFunction,



      }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(

            content:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 41.58.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text('Well done',style: TextDimensions.style36joseW300Grey,),
                  Image.asset("images/image 2.png",height: 46.h,width: 52.37.w,)
                ],),

                Text('Fatima',
                  style: TextDimensions.style36joseW600Grey,

                ),
   Center(child: Image.asset('images/Group 24.png',height: 162.41.h,width: 162.41.w,)),
              Align(
                  alignment: Alignment.center,
                  child: Text('$text/$subText',style: TextDimensions.style38josew600blue,))
                // Container(
                //   padding: EdgeInsets.only(left:16.w),
                //   height: 150.h,width: 499.w,
                //
                //   decoration: BoxDecoration(
                //     color: Color(0xffF5E9E2),
                //     borderRadius: BorderRadius.circular(16.r),
                //
                //   ),
                //
                //   child: Row(
                //
                //
                //     children: [
                //       Image.asset('images/Vector-3.png',height: 24.22.h,width: 24.22.w,),
                //       SizedBox(width: 10.w,),
                //       Container(
                //
                //           height: 114.h,
                //           width: 215.48.w,
                //
                //           child: Text('The skill level choosen determines how complex the questions would be. Take your time as the questions aren’t timed as you are can view the answers to the questions as you go.',
                //             style: TextDimensions.style16joseW400Black,)),
                //
                //
                //
                //
                //     ],),
                // ),
                // SizedBox(height: 40.h,),

              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  Container(

                    alignment: Alignment.center,
                    height: 52.h,
                    width: 132.w,
                    decoration: BoxDecoration(
                        color: Color(0xffF2E1D8),
                        borderRadius: BorderRadius.circular(16.r)

                    ),
                    child: Text('Continue',style: TextDimensions.style16joseW400Black,),

                  ),
                  SizedBox(width: 8.w,),
                  Container(

                    alignment: Alignment.center,
                    height: 52.h,
                    width: 132.w,
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(16.r)

                    ),
                    child: Text('See Solutions',style: TextDimensions.style16joseW400Black,),

                  ),
                ],
              ),

            ],
          );
        });
  }


  static void showCustomDialogOnboardingScreen(BuildContext context,
      {
        String okBtnText = "Yes",
        String cancelBtnText = "Cancel",
        String text='',
        String subText='',
        bool approved=true,
        required Function() okBtnFunction,
       required TextEditingController controller,



      }) {
    showDialog(
        context: context,
        builder: (_) {

          return AlertDialog(
alignment: Alignment.topCenter,
            content:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 41.58.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Hi',style: TextDimensions.style36joseW300Grey,),
                    Image.asset("images/image 1.png",height: 46.h,width: 52.37.w,)
                  ],),

                Text('What’s your name?',
                  style: TextDimensions.style36joseW600Grey,

                ),
           SizedBox(height: 23.h,),
           CustomTextField(text: 'Type here', controller: controller),

                // Container(
                //   padding: EdgeInsets.only(left:16.w),
                //   height: 150.h,width: 499.w,
                //
                //   decoration: BoxDecoration(
                //     color: Color(0xffF5E9E2),
                //     borderRadius: BorderRadius.circular(16.r),
                //
                //   ),
                //
                //   child: Row(
                //
                //
                //     children: [
                //       Image.asset('images/Vector-3.png',height: 24.22.h,width: 24.22.w,),
                //       SizedBox(width: 10.w,),
                //       Container(
                //
                //           height: 114.h,
                //           width: 215.48.w,
                //
                //           child: Text('The skill level choosen determines how complex the questions would be. Take your time as the questions aren’t timed as you are can view the answers to the questions as you go.',
                //             style: TextDimensions.style16joseW400Black,)),
                //
                //
                //
                //
                //     ],),
                // ),
                // SizedBox(height: 40.h,),

              ],
            ),
            actions: <Widget>[

              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: okBtnFunction,
                  child: Container(

                    alignment: Alignment.center,
                    height: 52.h,
                    width: 135.w,
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(16.r)

                    ),
                    child: Text('Submit',style: TextDimensions.style16joseW600White,),

                  ),
                ),
              ),

            ],
          );
        });
  }



}



class LevelWidget extends StatefulWidget {
  const LevelWidget({
    Key? key,
    required this.text,
    required this.level,
    required this.l,
  required this.cat,
    required this.tap
  }) : super(key: key);
  final String level;
  final String text;
  final Level l;
  final int cat;
  final Function() tap;


  @override
  State<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget> {



  @override
  Widget build(BuildContext context) {


    return
      GestureDetector(
      onTap:widget.tap,
      child: Container(
        height: 55.h,
        width: 329.w,
        padding: EdgeInsets.only(left: 18.w),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
color: Color(0xffE6EDF3),
          border: Border.all(color: Get.find<QuizController>().selectedLevel==widget.l?AppColors.lightBlue:AppColors.whiteColor)

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.level,style: TextDimensions.style16josew600blue,),
          SizedBox(width: 10.w,),
          Container(

            height: 31.h,
            width: 151.w,
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
            decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius:BorderRadius.circular(32.r)

          ),
          child: Text(widget.text,style: TextDimensions.style13joseW400grey,),

          ),


        ],
      ),



      ),
    );
  }
}