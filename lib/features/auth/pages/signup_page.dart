import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/core/widget/custom_elevated_button.dart';
import 'package:coursa/features/auth/widget/custom_container.dart';
import 'package:coursa/core/widget/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/features/controller/controller_page.dart';
class SignupPage extends StatelessWidget {
   SignupPage({super.key});
final signupFormkey = GlobalKey<FormState>();
  final TextEditingController usernameSignupController =TextEditingController();
  final TextEditingController passwordSignupController =TextEditingController();
  final TextEditingController confirmController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppPalette.whiteColor,
      body: Form(key:signupFormkey ,
        child: Column(
          children: [
            SizedBox(height: 45),
            CustomTextField(text: AppText.userName.tr(),controllers:usernameSignupController ,condition:(value) {
  if (value == null || value.isEmpty){
    return 'Username is required';
  }else if(value.length < 3 ) {
    return 'username should be more than 3 character ';

  }
  return null;
} ),
            CustomTextField(text: AppText.password.tr(),controllers:passwordSignupController,condition:  (value) {
  if (value == null || value.isEmpty){
    return 'Password is required';
  }else if(value.length < 8 ) {
    return 'Password should be more than 8 character ';

  }
  return null;
}),
            CustomTextField(text: AppText.confirm.tr(),controllers:confirmController ,condition: (value) {
  if (value == null || value.isEmpty){
    return 'Password confrim is required';
  }else if(value != passwordSignupController.text ){
    return 'Password and confrim password not Same';
  }
  FocusScope.of(context).unfocus();
  return null;
} ,),
            SizedBox(height: 36),
            CustomElevatedButton(
              onPressed: () async{
              if (signupFormkey.currentState!.validate()) {
    await Future.delayed(Duration(milliseconds: 500));
    if (!context.mounted) return;
    replacementNavigateor(context, BottomNavigationController());
  }
              },
              text: AppText.signUp.tr(),
            ),
            SizedBox(height: 27),
            Text(AppText.or.tr(), style: TextStyle(color: AppPalette.hintColor)),
            SizedBox(height: 19),
            CustomContainer(),
          ],
        ),
      ),
    );
  }
}
