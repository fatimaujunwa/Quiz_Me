import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizme/pages/Home%20page/home_screen.dart';
import 'package:quizme/utils/app_colors.dart';
import 'package:quizme/utils/routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double>animation;
  late AnimationController animationController;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(vsync: this,
    duration:  const Duration(seconds:2 )
    
    )..forward();
    animation = new 
    CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    Timer

      (const Duration(seconds: 4),
       ()=>Get.offNamed(RouteHelper.homeScreen));
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(child: 
        ScaleTransition(
            
            scale: animation,
            child: Image.asset('images/Group 28.png'))
        
        ,),
      
    );
  }
}
