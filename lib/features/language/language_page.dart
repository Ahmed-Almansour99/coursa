import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/controller/controller_page.dart';
import 'package:coursa/features/onboarding/onboarding_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/functions/change_language.dart';
class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key, this.fromHome=false});
final bool fromHome;
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
                child: Image.asset('assets/images/earth.png',fit: BoxFit.fill,width: context.getWidth(per: 4.8),height: context.getHeight(per: 2.4),),
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.getWidth(per: 0.4)),
                child: Container(width: context.getWidth(),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(context.getWidth(per: 2))),color: AppPalette.greylight ),
                        child: Column(
                          children: [Padding(
                padding: EdgeInsets.symmetric(vertical:context.getHeight(per: 0.5)),
                child: Text(context.locale.languageCode == 'ar'? AppText.chooseLanguage2:AppText.chooseLanguage, style:Theme.of(context).textTheme.titleMedium, ),
                          ),
                          SizedBox(height: context.getHeight(per: 0.1),)
                          ,
                          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                           padding:  EdgeInsets.symmetric(horizontal:context.getWidth(per: 0.50) ,vertical: context.getHeight(per: 0.5)),
                        child: ElevatedButton(
             onPressed: () async {
              context.locale.languageCode == 'ar' ?
                          changeLanguage(context, 'ar'):
                          changeLanguage(context, 'en');
                          await Future.delayed(Duration(milliseconds: 500));
                          if (!context.mounted) return;
                         widget.fromHome ?
                         replacementNavigateor(context, BottomNavigationController()) :
                          replacementNavigateor(context, OnboardingPage());
                          },  
                          child: Text(context.locale.languageCode == 'ar' ? AppText.languageAr:AppText.languageEn, style: Theme.of(context).textTheme.bodyMedium,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                         padding:  EdgeInsets.symmetric(horizontal:context.getWidth(per: 0.50),vertical: context.getHeight(per: 0.5)),
                        child: ElevatedButton(
                          onPressed: ()  async{
                            context.locale.languageCode == 'ar' ?
                         changeLanguage(context, 'en'):
                         changeLanguage(context, 'ar');
                        await Future.delayed(Duration(milliseconds: 500));
                          if (!context.mounted) return;
                          widget.fromHome ?
                         replacementNavigateor(context, BottomNavigationController()) :
                        replacementNavigateor(context, OnboardingPage());
                                      },
                          child: Text(context.locale.languageCode == 'ar' ? AppText.languageEn: AppText.languageAr, style: Theme.of(context).textTheme.bodyMedium),
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