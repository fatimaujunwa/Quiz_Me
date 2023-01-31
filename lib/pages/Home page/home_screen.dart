import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/routing.dart';
import 'package:quizme/utils/text_dimensions.dart';

import '../../helper/helper_functions.dart';
import '../../utils/widgets/custom_dialogue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller=TextEditingController();


  void createAlert(){

    CustomDialogue.showCustomDialogOnboardingScreen(context, okBtnFunction: (){
      print(controller.text);
      if(controller.text.isEmpty){
        print('empty');

        HelperFunctions.saveFirstNameStatus(false);
        // Navigator.pop(context);

      }
      else{
        print('not empty');
        HelperFunctions.saveFirstNameStatus(true);
        HelperFunctions.saveFirstName(controller.text.trim());
        // Navigator.pop(context);


      }


    }, controller: controller);
  }

  @override
  void initState() {


    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    HelperFunctions.getFirstNameStatus().then((value) {

      if(value==true){
        print(value);


      }
      else{
        Future.delayed(Duration.zero,()=>createAlert());
        print(false);



      }
    });

    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.topRight,
          child: Image.asset('images/Vector-2.png'),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 485.h,
                  margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 72.99.h),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,',
                                style: TextDimensions.style36joseW300Grey,
                              ),
                              Text(
                                'Fatima,',
                                style: TextDimensions.style36joseW600Grey,
                              ),
                            ],
                          ),
                          Container(
                            height: 57.h,
                            width: 122.w,
                            padding: EdgeInsets.only(left: 20.w,right: 20.w),
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
Image.asset('images/Vector-5.png',width: 24.22.w,height: 24.22.h),
                                GestureDetector(
                                  onTap: (){
                                    Get.toNamed(RouteHelper.profile);
                                  },

                                    child: Image.asset('images/Vector-4.png',width: 24.22.w,height: 24.22.h,)),
                            ],),
                          ),
                        ],
                      ),
                  SizedBox(
                            height: 26.01.h,



                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PointsWidget(image: 'images/Rectangle 7.png',text: '10 points', height: 236.h, width: 187.w,img: 'images/amico.png',imgHeight: 146.09.h,imgWidth: 132.w,),
                              SizedBox(width: 8.w,),
                              Padding(
                                padding:  EdgeInsets.only(top: 49.14.h),
                                child: PointsWidget(image: 'images/Rectangle 6.png',text: '10 points', height: 236.h, width: 187.w,img: 'images/Group 24.png',imgHeight: 146.09.h,imgWidth: 132.w,),
                              ),

                            ],
                          ),
                      SizedBox(height: 41.97.h,),
                          Text('Popular',style: TextDimensions.style32joseW600Black,)

                    ],
                  )),
              ListView.separated(
                padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 30,
                  itemBuilder: (_, i) {
                    return

                   (i%2==0) ?  GestureDetector(
                     onTap: (){
                     CustomDialogue.showCustomDialog(context, okBtnFunction: (){});
                     },
                       child: QuizWidget(text:'Test your math skills with out free numeracy quizzes' ,img: 'images/Rectangle 8.png', title: 'Numeracy Quiz',)):GestureDetector(
                     onTap: (){
                       CustomDialogue.showCustomDialog(context, okBtnFunction: (){});
                     },

                       child: QuizWidget(text:'Test your math skills with out free numeracy quizzes' ,img: 'images/Rectangle 9.png', title: 'Numeracy Quiz',));
                  }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 8.h,);
              },)
            ],
          ),
        ),
      ]),
    );
  }
}

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    Key? key,
    
    required this.text,
    required this.title,
    required this.img,

  }) : super(key: key);
  final String title;
  final String text;
  final String img;


  @override
  Widget build(BuildContext context) {
    return Container(
    width: 382.w,
    height: 100.h,

      margin: EdgeInsets.only(left: 16.w,right: 16.w),

    decoration: BoxDecoration(

        image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.fill)),
    child: Container(
        padding: EdgeInsets.only(left: 16.96.w, top: 16.h),

        child: Row(
          children: [
            Text('h'),
            SizedBox(
              width: 16.65.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextDimensions.style24joseW400Black,
                ),
                SizedBox(
                  height: 6.h,
                ),
               Container(

                  height: 40.h,
                  width: 277.85.h,
                  child: Text(
                    text,
                    style: TextDimensions
                        .style16joseW400lightgrey,
                    maxLines: 2,
                    softWrap: true,
                  ),
                )
              ],
            )
          ],
        )),
                    );
  }
}

class PointsWidget extends StatelessWidget {
  const PointsWidget(
      {Key? key,
      required this.text,
      required this.image,
      required this.height,
      required this.width,
      required this.img,required this.imgHeight,
        required this.imgWidth
      })
      : super(key: key);
  final String text;
  final String image;

  final double height;
  final double width;
  final String img;
  final double imgHeight;
  final double imgWidth;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:23.53.h ),
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(offset: Offset(-0, 4),blurRadius: 10,color: Colors.grey.withOpacity(1))
          ]
      ),
      child: Column(children: [
 Image.asset(img,height:imgHeight ,width: imgWidth,),
        SizedBox(height:30.h ,),
        Text('10 points',style: TextDimensions.style24joseW400White,)
      ],),
    );
  }
}


