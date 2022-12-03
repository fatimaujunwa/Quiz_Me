import 'package:flutter/material.dart';
import 'package:quizme/utils/widgets/custom_dialogue.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    
    return Scaffold(

      body:Center(child: GestureDetector(
        onTap: (){
          CustomDialogue.showCustomDialogOnboardingScreen(context, okBtnFunction: (){

          }, controller: controller);
        },

          child: Container(color: Colors.red,height: 100,width: 100,))) ,
    );
  }
}
