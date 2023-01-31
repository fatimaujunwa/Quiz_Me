import 'package:flutter/material.dart';
import 'package:quizme/helper/helper_functions.dart';
import 'package:quizme/utils/widgets/custom_dialogue.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(

      body:Center(child: GestureDetector(
        onTap: (){
          // CustomDialogue.showCustomDialogOnboardingScreen(context, okBtnFunction: (){
          //
          // }, controller: controller);
        },

          child: Container(color: Colors.red,height: 100,width: 100,))) ,
    );
  }
}
