import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/text_dimensions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:73.h ,left: 16.w,right: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios,size: 20,color: AppColors.lightBlue,),
                    SizedBox(width: 22.w,),
                    Text('Verbal R',style: TextDimensions.style28joseW600Grey,),
                    SizedBox(width: 25.w,),
                    Text('Beginner',style: TextDimensions.style28joseW300grey,),
                    // SizedBox(width: 40.16.w,),
                    Image.asset('images/Vector-5.png',

                      // height: 31.h,width: 31.w,

                    )
                  ],

                ),
                SizedBox(height: 55.h,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 367.07.h,width: 383.33.w,
                    padding: EdgeInsets.only(left: 22.7.w,right: 22.7.w,top: 28.h),
                    decoration: BoxDecoration(
                      color: Color(0xffF4F6F9),
                      borderRadius: BorderRadius.circular(16.r)

                    ),
                    child: Text('Lorem ipsum dolor sit amet consectetur. Integer pulvinar at in pulvinar risus volutpat.'
                        ' Sit velit turpis non a ac in. Nunc sed platea blandit quam nisi sem pulvinar nulla faucibus. Consequat cursus commodo vestibulum ornare ipsum.Id urna elit ultricies ac lobortis arcu.',style: TextDimensions.style20joseW400Grey,textAlign: TextAlign.justify,),
                    ),
                  ],
                ),
                SizedBox(height: 24.h,),
                Container(
                  height: 56.h,
                  width: 379.w,
                  padding: EdgeInsets.only(left: 24.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                  color: Color(0xffF2E1D8),
borderRadius: BorderRadius.circular(16.r),

                      
                      
                ),
                child: Text('A. Twenty boys',style:TextDimensions.style24joseW400Black ,),

                ),
                SizedBox(height: 12.h,),
                Container(
                  height: 56.h,
                  width: 379.w,
                  padding: EdgeInsets.only(left: 24.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xffF2E1D8),
                    borderRadius: BorderRadius.circular(16.r),



                  ),
                  child: Text('A. Twenty boys',style:TextDimensions.style24joseW400Black ,),

                ),
                SizedBox(height: 12.h,),
                Container(
                  height: 56.h,
                  width: 379.w,
                  padding: EdgeInsets.only(left: 24.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xffF2E1D8),
                    borderRadius: BorderRadius.circular(16.r),



                  ),
                  child: Text('A. Twenty boys',style:TextDimensions.style24joseW400Black ,),

                ),
                SizedBox(height: 20.4.h,),
                Container(
                  height: 100.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_,i){
return CircleAvatar(radius: 30.6.r,backgroundColor: AppColors.lightBlue,child: Text(i.toString(),style: TextDimensions.style29joseW400white,),);
                  }, separatorBuilder: (_,i){
                   return SizedBox(width: 14.58.w,);

                  }, itemCount: 20),

                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
