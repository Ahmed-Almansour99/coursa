import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/auth/pages/social_login.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.beigeColor, width: 2),
           
            ),
             child: IconButton(icon:Image.asset(AppText.facebookImagePath),onPressed: (){pushNavigator(context, SocialLogin(imagepath:  AppText.facebookImagePath));},),
          ),
           
        
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.beigeColor, width: 2),
            
            ),
            child: IconButton(icon:Image.asset(AppText.xImagePath),onPressed: (){pushNavigator(context, SocialLogin(imagepath:AppText.xImagePath));},),
          
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.beigeColor, width: 2),
          ),
           child: IconButton(icon:Image.asset(AppText.googleImagePath),onPressed: (){pushNavigator(context, SocialLogin(imagepath:AppText.googleImagePath));},),
        ),
      ],
    );
  }
}
