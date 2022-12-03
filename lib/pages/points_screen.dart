import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizme/pages/Home%20page/home_screen.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/text_dimensions.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
height: 897.95.h,
            alignment: Alignment.topRight,
            child: Image.asset('images/Vector-2.png'),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 485.h,

                  margin: EdgeInsets.only(top:73.h ,left: 16.w,right: 16.w),
child: Column(children: [
  Row(children: [
    Icon(Icons.arrow_back_ios,color: AppColors.lightBlue,size: 21,),
    SizedBox(width: 22.36.w,),
    Text('Your Points\n earned',style: TextDimensions.style36joseW600Grey,)
  ],),
  SizedBox(height: 28.h,),
  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PointsWidget(image: 'images/Rectangle 7.png',text: '10 points', height: 274.59.h, width: 217.58.w,img: 'images/amico.png', imgHeight: 169.98.h, imgWidth: 153.58.w,),
      SizedBox(width: 16.w,),
      Container(

        height: 274.59.h,
        width: 147.42.w,

        child: Column(

          children: [
            Text("""Points are earned when you complete a challange. 
""",style: TextDimensions.style20joseW400Grey,textAlign: TextAlign.justify),

            Text('These challeges are provided to keep track of your progress and encourage you to do more.',style: TextDimensions.style20joseW400Grey,textAlign: TextAlign.justify)
          ],
        ),
      )
    ],
  ),


],),



                  ),
                ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_,i){
                  return Container(
                    padding: EdgeInsets.only(left: 19.w),
                    height:67.h ,
                    width: 382.w,
                    margin: EdgeInsets.only(left: 16.w,right: 16.w),


                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Row(children: [
                    Image.asset('images/trophy.png',height: 22.22.h,width: 25.w,),
                    SizedBox(width: 10.w,),
                    Text('Complete 1 quiz for each quiz type',style: TextDimensions.style16joseW400White,)
                  ],),

                  );
                }, separatorBuilder:(_,i){
                  return SizedBox(height:12.h ,);
                }, itemCount: 30)
              ],
            ),
          )
        ],
      ),

    );
  }
}
