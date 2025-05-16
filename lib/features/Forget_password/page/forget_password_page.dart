
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/features/Forget_password/custom_alert_wedgit.dart';
import 'package:coursa/features/auth/widget/custom_text_field.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
   final _forgetkey =GlobalKey<FormState>();
final TextEditingController email = TextEditingController();
 final emailRegExp = RegExp(
  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(AppText.projectTitle,style: Theme.of(context).textTheme.titleLarge,),),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: context.getWidth(per: 1.90)),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: context.getHeight(per: 2),),
              Form( key: _forgetkey,
                child: CustomTextField(text:AppText.enterEmail ,controllers:email ,condition: (value) {
                  if(value == null || value.isEmpty){
                    return "email is requierd";
                  }else if (!emailRegExp.hasMatch(value)) {
                    return 'Email not correct ';
                  }
                  return null;
                },
                
                
                ),
              ), SizedBox(height: context.getHeight(per: 1),)
              ,ElevatedButton(onPressed: (){if (_forgetkey.currentState!.validate()) {showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(title:  AppText.emailSend, bodyText:  AppText.emailMessage, buttonText:  AppText.moveToLogin);
          },
              );}   }, child: Text(AppText.verfy)),
               SizedBox(height: context.getHeight(per: 3),)
            ],
          ),
        ),
      )),
    );
  }
}