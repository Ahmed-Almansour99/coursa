import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/onboarding/onboarding_page.dart';

import 'package:flutter/material.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/functions/change_language.dart';
class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(AppText.projectTitle,style: Theme.of(context).textTheme.titleLarge,),),
      body: SafeArea(
        child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: context.getKeyboardHeight()),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.getHeight(per: 0.39)),
                child: Image.asset('assets/images/earth.png',fit: BoxFit.fill,width: context.getWidth(per: 4.8),height: context.getHeight(per: 2.5),),
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.getWidth(per: 0.4)),
                child: Container(width: context.getWidth(),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(context.getWidth(per: 2))),color: AppPalette.greylight ),
                        child: Column(
                          children: [Padding(
                padding: EdgeInsets.symmetric(vertical:context.getHeight(per: 0.5)),
                child: Text(AppText.chooseLanguage, style:Theme.of(context).textTheme.titleMedium, ),
                          ),
                          SizedBox(height: context.getHeight(per: 0.1),)
                          ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                           padding:  EdgeInsets.symmetric(horizontal:context.getWidth(per: 1.00) ,vertical: context.getHeight(per: 0.5)),
                        child: ElevatedButton(
                            onPressed: ()  {
                         changeLanguage(context, 'ar' );
                        if (!mounted) return;
                        replacementNavigateor(context, OnboardingPage());
                                      
                          },
                          child: Text(AppText.languageAr, style: Theme.of(context).textTheme.bodyMedium,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                         padding:  EdgeInsets.symmetric(horizontal:context.getWidth(per: 1.00),vertical: context.getHeight(per: 0.5)),
                        child: ElevatedButton(
                          onPressed: ()  {
                         changeLanguage(context, 'en');
                        if (!mounted) return;
                        replacementNavigateor(context, OnboardingPage());
                                      },
                          child: Text(AppText.languageEn, style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ),
                  ],
                ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}