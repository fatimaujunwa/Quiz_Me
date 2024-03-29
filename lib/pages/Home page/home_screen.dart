import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/controller/quiz_controller.dart';
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
  TextEditingController controller = TextEditingController();

  void createAlert() {
    CustomDialogue.showCustomDialogOnboardingScreen(context, okBtnFunction: () {
      if (controller.text.isEmpty) {
        HelperFunctions.saveFirstNameStatus(false);
        Navigator.pop(context);
      } else {
        HelperFunctions.saveFirstNameStatus(true);
        HelperFunctions.saveFirstName(controller.text.trim());
        Navigator.pop(context);
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
      if (value == true) {
      } else {
        Future.delayed(Duration.zero, () => createAlert());
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
                  height: 480.h,
                  margin:
                      EdgeInsets.only(left: 16.w, right: 16.w, top: 72.99.h),
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
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('images/Vector-5.png',
                                    width: 24.22.w, height: 24.22.h),
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteHelper.profile);
                                    },
                                    child: Image.asset(
                                      'images/Vector-4.png',
                                      width: 24.22.w,
                                      height: 24.22.h,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26.01.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PointsWidget(
                            image: 'images/Rectangle 7.png',
                            height: 236.h,
                            width: 187.w,
                            img: 'images/amico.png',
                            imgHeight: 146.09.h,
                            imgWidth: 132.w,
                            // stars: stars,
                            type: PointsType.trophytype,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 49.14.h),
                            child: PointsWidget(
                              image: 'images/Rectangle 6.png',
                              height: 236.h,
                              width: 187.w,
                              img: 'images/Group 24.png',
                              imgHeight: 146.09.h,
                              imgWidth: 132.w,
                              type: PointsType.starstype,
                              // stars: stars,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 41.97.h,
                      ),
                      Text(
                        'Popular',
                        style: TextDimensions.style32joseW600Black,
                      )
                    ],
                  )),
              GetBuilder<QuizController>(builder: (controller) {
                List<String> category = controller.categoryNames();
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: category.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                        onTap: () {
                          CustomDialogue.showCustomDialog(context,
                              okBtnFunction: () {}, categoryNo: controller.categories[category[i]]!, categoryName: category[i]);
                        },
                        child: quiz(i, category));
                    // return (i % 2 == 0)
                    //     ?
                    // GestureDetector(
                    //         onTap: () {
                    //
                    //
                    //           CustomDialogue.showCustomDialog(context,
                    //               okBtnFunction: () {}, category: i + 9);
                    //         },
                    //         child: QuizWidget(
                    //             text:
                    //                 'Test your ${category[i]} skills with out free quizzes',
                    //             img: 'images/Rectangle 8.png',
                    //             title: category[i]))
                    //     : GestureDetector(
                    //         onTap: () {
                    //
                    //           CustomDialogue.showCustomDialog(context,
                    //               okBtnFunction: () {}, category: i + 9);
                    //         },
                    //         child: QuizWidget(
                    //           text:
                    //               'Test your ${category[i]} skills with out free quizzes',
                    //           img: 'images/Rectangle 9.png',
                    //           title: category[i],
                    //         ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8.h,
                    );
                  },
                );
              }),
              SizedBox(
                height: 30.h,
              )
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
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
      child: Container(
          padding: EdgeInsets.only(left: 16.96.w, top: 16.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextDimensions.style24joseW400Black,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    height: 40.h,
                    width: 350.85.h,
                    child: Text(
                      text,
                      style: TextDimensions.style16joseW400lightgrey,
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

enum PointsType { starstype, trophytype }

class PointsWidget extends StatelessWidget {
  const PointsWidget(
      {Key? key,
      required this.image,
      required this.height,
      required this.width,
      required this.img,
      required this.imgHeight,
      required this.imgWidth,
      required this.type,
      this.stars = 0})
      : super(key: key);

  final String image;

  final double height;
  final double width;
  final String img;
  final double imgHeight;
  final double imgWidth;
  final int stars;
  final PointsType type;

  @override
  Widget build(BuildContext context) {
    // int stars = Get.find<QuizController>().getStars();
    // print('stars r $stars');
    return Container(
      padding: EdgeInsets.only(top: 23.53.h),
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(
                offset: Offset(-0, 4),
                blurRadius: 10,
                color: Colors.grey.withOpacity(1))
          ]),
      child: Column(
        children: [
          Image.asset(
            img,
            height: imgHeight,
            width: imgWidth,
          ),
          SizedBox(
            height: 30.h,
          ),
          GetBuilder<QuizController>(
            builder: (controller) {
              return Text(
                type == PointsType.starstype
                    ? '${controller.getStars()} points'
                    : ' 12 points',
                style: TextDimensions.style24joseW400White,
              );
            },
          )
        ],
      ),
    );
  }
}

Widget quiz(int i, List category) {
  if (i % 2 == 0) {
    // if (i ==4 || i ==15 ||i == 16 ||i ==21){
    //   return SizedBox.shrink();
    // }
    return QuizWidget(
        text: 'Test your ${category[i]} skills with out free quizzes',
        img: 'images/Rectangle 8.png',
        title: category[i]);
  } else {
    // if (i ==4 || i ==15 ||i == 16 ||i ==21){
    //   return SizedBox.shrink();
    // }
    return QuizWidget(
      text: 'Test your ${category[i]} skills with out free quizzes',
      img: 'images/Rectangle 9.png',
      title: category[i],
    );
  }
}
