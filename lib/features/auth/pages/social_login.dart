import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/widget/custom_elevated_button.dart';
import 'package:coursa/core/widget/custom_text_field.dart';
import 'package:coursa/features/controller/controller_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
   SocialLogin({super.key, required this.imagepath});
final String imagepath;
 final _loginFormkey = GlobalKey<FormState>();
 final TextEditingController usernameLoginController =TextEditingController();
 final TextEditingController passwordLoginController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(centerTitle: true,title: Text(AppText.projectTitle,style: Theme.of(context).textTheme.titleLarge,),),
body: SafeArea(child: 
SingleChildScrollView(
  child: Form(key: _loginFormkey,
    child: Column(children: [
      SizedBox(height: context.getHeight(per: 2),),
      Image.asset(imagepath,height: context.getHeight(per: 2),width: context.getWidth(per: 2),),
    SizedBox(height: context.getHeight(per: 1),),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getWidth(per: 1)),
      child: CustomTextField(text: AppText.userName.tr(),controllers:usernameLoginController,condition:(value) {
        if (value == null || value.isEmpty){
          return 'Username is required';
        }else if(value.length < 3 ) {
          return 'username should be more than 3 character ';
      
        }
        return null;
      } ),
    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.getWidth(per: 1)),
                child: CustomTextField(text: AppText.password.tr(),obscureText: true,controllers: passwordLoginController,condition: (value) {
                    if (value == null || value.isEmpty){
                      return 'Password is required';
                    }else if(value.length < 8 ) {
                      return 'Password should be more than 8 character ';
                  
                    }else if(value != '11112222' || usernameLoginController.text != 'Ahmed' ) {
                      return 'The Username Or Password Not Correct';
                    }
                    FocusScope.of(context).unfocus();
                    return null;
                  }),
              ),
    SizedBox(height: 45),
              CustomElevatedButton(
                onPressed: () {
                  if (_loginFormkey.currentState!.validate()) {
        
        replacementNavigateor(context, BottomNavigationController());
      }
                },
                text: AppText.logIn.tr(),
              ),
    
    
    
    
    
    
    
    
    ]
    ,),
  ),
)
),
  );
  }
}