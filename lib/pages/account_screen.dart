import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizme/helper/helper_functions.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/widgets/custom_snackbar.dart';

import '../utils/text_dimensions.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String ?x='hi';
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController email=TextEditingController();
  setBio(TextEditingController fname )async{
   HelperFunctions.getFirstName().then((value) {
setState(() {
  fname.text=value!;
});


   });
   HelperFunctions.getLastName().then((value) {
     if(value!=null){

       setState(() {
         lname.text=value!;
       });
     }
     else{
       print('null');
     }



   });
   HelperFunctions.getEmail().then((value) {
     if(value!=null){
       setState(() {
         email.text=value!;
       });
     }
     else{
      print('null');
     }



   });
   HelperFunctions.getAge().then((value) {
     if(value!=null){
       setState(() {
         age.text=value!;
       });
     }
     else{
       print('null');
     }



   });



  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setBio(fname);

  }
  @override
  Widget build(BuildContext context) {

    print(lname.text);

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
                  margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 72.99.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios,size: 20,color: AppColors.lightBlue,),
                          Text(
                            'Hi ,',
                            style: TextDimensions.style36joseW300Grey,
                          ),
                          Text(
                            fname.text,
                            style: TextDimensions.style36joseW600Grey,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Row(children: [
                        AccountPointWidget(color: AppColors.lightBlue,img: 'images/amico.png',),
                        SizedBox(width: 8.w,),
                        AccountPointWidget(color: AppColors.orange,img: 'images/Group 24.png',)
                      ],),
                      SizedBox(height: 40.85.h,),
                      Text('Your Profile',style: TextDimensions.style24joseW400Black,),
                      SizedBox(height: 10.h,),
                      CustomTextField(controller: fname,text: 'Fatima'),
                      CustomTextField(controller: lname,text: 'Ujunwa',),
                      CustomTextField(controller:age,text: '19',),
                      CustomTextField(controller: email,text: 'xxx@gmail.com'),
SizedBox(height: 40.h,),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            HelperFunctions.saveFirstName(fname.text);
                            HelperFunctions.saveLastName(lname.text);
                            HelperFunctions.saveAge(age.text);
                            HelperFunctions.saveEmail(email.text);
                           showCustomSnackBar('Updated Successfully', 'Bio-Data update');


                          },
                          child: Container(
                            alignment: Alignment.center,
                            height:52.h ,
                            width: 135.w,

                            decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(16.r),



                          ),
                          child: Text('Update',style: TextDimensions.style16joseW600White,),

                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),

    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller
  }) : super(key: key);
final TextEditingController controller;
final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
controller: controller,
      style: TextDimensions.style16joseW400Black,
      decoration: InputDecoration(

      hintText: text,
      hintStyle: TextDimensions.style16joseW400lightgrey,
      filled: true,
      fillColor:Color(0xffF4F6F9) ,
      border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide.none
      ),

    ),
    textAlign: TextAlign.start,
      maxLines: 1,
      maxLength: 20,
    );
  }
}

class AccountPointWidget extends StatelessWidget {
  const AccountPointWidget({
    Key? key,
    required this.color,
    required this.img
  }) : super(key: key);
  final String img;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top: 20.91.h,left: 16.36.w) ,
      height: 80.64.h,width: 187.w,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16.r),

    ),
      child: Column(children: [
        Row(children: [
          Image.asset(img,height: 40.h,width: 36.14.w,),
          SizedBox(width: 16.w,),
          Text('0 points',style: TextDimensions.style20joseW400White,)
        ],)

      ],),
    );
  }
}
