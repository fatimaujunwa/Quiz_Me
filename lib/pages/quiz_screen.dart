import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/controller/quiz_controller.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/text_dimensions.dart';

import '../model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;

  void generate() {
    Random random = new Random();
    while (a == b || a == c || b == c || a == d || b == d || c == d) {
      a = random.nextInt(4);
      b = random.nextInt(4);
      c = random.nextInt(4);
      d = random.nextInt(4);
    }
    print("$a $b $c $d");
  }

late List<Results> results;
late int index;
  @override
  void initState() {
    // Get.find()
    results =Get.arguments[0];
    index =Get.arguments[1];
    Get.find<QuizController>().setIndex = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
    
       
      });
    // TODO: implement initState
    super.initState();

  }
  
  



  @override
  Widget build(BuildContext context) {

  



    // print(data.correctAnswer);
    generate();
    return Scaffold(


      body: SingleChildScrollView(
        child:GetBuilder<QuizController>(builder: (controller) {
        


          controller.map[index] = true;
         
          List<String>?questions=results[controller.index].incorrectAnswers;
          questions?.add(results[controller.index].correctAnswer!);
          print(questions);
          return
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 73.h, left: 16.w, right: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){

                              // print(controller.category_list);
                              Get.back();

                              // controller.showResults(context);
                              controller.reset();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.lightBlue,
                            ),
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Text(

                            'Verbal R ',
                            style: TextDimensions.style28joseW600Grey,
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            'Beginner',
                            style: TextDimensions.style28joseW300grey,
                          ),
                          // SizedBox(width: 40.16.w,),
                          Image.asset(
                            'images/Vector-5.png',

                            // height: 31.h,width: 31.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 367.07.h,
                            width: 383.33.w,
                            padding: EdgeInsets.only(
                                left: 22.7.w, right: 22.7.w, top: 28.h),
                            decoration: BoxDecoration(
                                color: Color(0xffF4F6F9),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Text(

                              results[controller.index].question!.replaceAll('&quot;', "\"")
                              ,
                              style: TextDimensions.style20joseW400Grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SelectionWidget(questions: questions, d: a, tap: () {
                       Get.find<QuizController>().selectAnswer(results[controller.index].correctAnswer!, questions![a],results[controller.index].category!,context);

                      }, letter: 'A. ',),
                      SizedBox(
                        height: 12.h,
                      ),
                      SelectionWidget(questions: questions, d: d, tap: () {
                        
                         Get.find<QuizController>().selectAnswer(results[controller.index].correctAnswer!, questions![d],results[controller.index].category!,context);
                      }, letter: 'B. ',),
                      SizedBox(
                        height: 12.h,
                      ),
                      SelectionWidget(questions: questions, d: b, tap: () {
                        Get.find<QuizController>().selectAnswer(results[controller.index].correctAnswer!, questions![b],results[controller.index].category!,context);
                      }, letter: 'C. ',),
                      SizedBox(
                        height: 12.h,
                      ),
                      SelectionWidget(questions: questions, d: c, tap: () {
                        Get.find<QuizController>().selectAnswer(results[controller.index].correctAnswer!, questions![c],results[controller.index].category! ,context);
                      }, letter: 'D. ',),
                      // ListView.separated(
                      //     shrinkWrap: true,
                      //     primary: false,
                      //     itemBuilder: (_,index){
                      //   return
                      //
                      //
                      // }, separatorBuilder:(_,i){
                      //   return
                      //
                      // }, itemCount: questions!.length)


                      SizedBox(
                        height: 10.4.h,
                      ),
                      Container(
                        height: 100.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.buttonClicked(i, true,context,results[controller.index].category!);
                                    // controller.incrementQuestion(context,results[controller.index].category!);
                                    // controller.getIndex(i);
                                    // controller.updateIndex = i;

                                  },
                                  child: CircleAvatar(
                                    radius: 30.6.r,

                                    backgroundColor: controller.map[i] == true
                                        ? AppColors.lighterBlue
                                        : AppColors.lightBlue,
                                    child: Text(
                                      i.toString(),
                                      style:
                                      controller.map[i] ==true? TextDimensions.style29joseW400blue:
                                      
                                       TextDimensions.style29joseW400white,
                                    ),
                                  ));
                            },
                            separatorBuilder: (_, i) {
                              return SizedBox(
                                width: 14.58.w,
                              );
                            },
                            itemCount: 10)
                      )
                    ],
                  ),
                )
              ],
            );
        }

      ),
    ));
  }
}

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    Key? key,
    required this.questions,
    required this.d,
    required this.tap,
    required this.letter
  }) : super(key: key);

  final List<String>? questions;
  final int d;
  final String letter;
  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 56.h,
        width: 379.w,
        padding: EdgeInsets.only(left: 24.w),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(0xffF2E1D8),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          '$letter '
          +questions![d],

          style: TextDimensions.style24joseW400Black,
        ),
      ),
    );
  }
}
