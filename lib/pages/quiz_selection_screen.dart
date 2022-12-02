import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/text_dimensions.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.only(top:73.h ,left: 16.w,right: 16.w),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(Icons.arrow_back_ios,size: 20,color: AppColors.lightBlue,),
                    SizedBox(width: 22.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Numeracy Quizzes',style: TextDimensions.style28joseW600Grey,),
                        SizedBox(height: 15.5.h,),
                        Row(
                          children: [
                            Text('Beginner',style: TextDimensions.style24joseW300grey,),
                            SizedBox(width: 16.w,),
                            Container(
                              alignment: Alignment.center,
                              height: 31.h,
                              width: 152.w,
                              decoration: BoxDecoration(
                                  color: AppColors.lightBlue,
                                  borderRadius: BorderRadius.circular(32.r)
                              ),
                              child: Text('14 Available quizzes',style: TextDimensions.style13joseW500grey,),

                            )
                          ],
                        ),




                      ],
                    ),


                  ],),
                  SizedBox(height:32.h ,),
                  Container(height: 185.74.h,
                    width: 379.w,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F6F9),
                      borderRadius: BorderRadius.circular(16.r),


                    ),
child: Row(children: [
  Expanded(child: Image.asset('images/math.png',height: 145.91.h,width: 138.06.w,)),
  Expanded(child: Container(child: Text('Get access to all our tricky numeracy problems to strengthen your problem solving skills ',style: TextDimensions.style18joseW500grey,),))

],),
                  ),
                  SizedBox(height: 24.17.h,),
                  Text('Tap a quiz to begin',style: TextDimensions.style18joseW400grey,)


                ],
              ),

            ),
            Container(
              padding: EdgeInsets.only(left: 16.w,right: 16.w),
              height: 700.h,

              child: GridView.builder(
physics: NeverScrollableScrollPhysics(),
               
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8.06.w,
                    mainAxisSpacing: 20.w,), itemBuilder:(_,context){
               return Container(
alignment: Alignment.center,
                 height: 115.41.h,
                  width: 122.97.w,
                  decoration: BoxDecoration(

                    color: Color(0xffF4F6F9),
                  borderRadius: BorderRadius.circular(16.r),

                  ),
                 child: Text('3',style: TextDimensions.style48joseW600grey,),
                );

              }),
            )
          ],
        ),
      ),

    );
  }
}
