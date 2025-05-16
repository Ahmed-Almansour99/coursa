import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/core/widget/custom_elevated_button.dart';
import 'package:coursa/features/Forget_password/forget_password_page.dart';
import 'package:coursa/features/auth/widget/custom_container.dart';
import 'package:coursa/features/auth/widget/custom_text_field.dart';
import 'package:coursa/features/controller/controller_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final _loginFormkey = GlobalKey<FormState>();
 final TextEditingController usernameLoginController =TextEditingController();
 final TextEditingController passwordLoginController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppPalette.whiteColor,
      body: Column(
        children: [
          SizedBox(height: 45),
          Form(key: _loginFormkey,child:
          Column(children: [
          CustomTextField(text: AppText.userName.tr(),controllers:usernameLoginController,condition:(value) {
  if (value == null || value.isEmpty){
    return 'Username is required';
  }else if(value.length < 3 ) {
    return 'username should be more than 3 character ';

  }
  return null;
} ),
          CustomTextField(text: AppText.password.tr(),controllers: passwordLoginController,condition: (value) {
  if (value == null || value.isEmpty){
    return 'Password is required';
  }else if(value.length < 8 ) {
    return 'Password should be more than 8 character ';

  }else if(value != '11112222' || usernameLoginController.text != 'Ahmed' ) {
    return 'The Username Or Password Not Correct';
  }
  FocusScope.of(context).unfocus();
  return null;
})
          ],
          )
          
          ),
          SizedBox(height: 45),
          CustomElevatedButton(
            onPressed: () {
              if (_loginFormkey.currentState!.validate()) {
    
    replacementNavigateor(context, ControllerPage());
  }
            },
            text: AppText.logIn.tr(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {pushNavigator(context, ForgetPassword());},
              child: Text(
                AppText.forgot.tr(),
                style: TextStyle(color: AppPalette.hintColor),
              ),
            ),
          ),
          Text(AppText.or.tr(), style: TextStyle(color: AppPalette.hintColor)),
          SizedBox(height: 19),
          CustomContainer(),
        ],
      ),
    );
  }
}

 