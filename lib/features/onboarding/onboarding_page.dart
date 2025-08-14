
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/auth/pages/background_page.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/functions/navigation.dart';
//intro screen class
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller =PageController();
  // on last page true
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // make stack for pages and photos and dots
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children:[
                  //page view for the three pages
                  PageView.builder(
                    
                            itemCount: AppText.onboardingContent.length,
                            controller: _controller,
                            onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == AppText.onboardingContent.length - 1);
                  });
                            },
                            itemBuilder: (context, index) {
                  final content = AppText.onboardingContent[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Image.asset(content['image']!, height: context.getHeight(per: 2)),
                          SizedBox(height: 12), 
                   Text(
                            content['title']!.tr(),
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          
                          SizedBox(height: 8),
                          Text(
                            content['subtitle']!.tr(),
                            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                    ],
                  );
                            },
                          ),
               
                // next button and dots here
                Container(alignment: Alignment(0, 0.95),child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:context.getWidth(per:1.5)),
                  child:Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:[
    SizedBox(width: context.getWidth(per: 2.2),),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: SlideEffect(
              dotColor: AppPalette.greylight,
              activeDotColor: AppPalette.beigeColor,
              type: SlideType.slideUnder,
            ),
          ),GestureDetector(
            onTap: () {
              if (onLastPage == false) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                replacementNavigateor(context, BackgroundPage());
              }
            },
            child: Image.asset(
             context.locale.languageCode == 'ar' ? AppText.inverseNextImagePath:AppText.nextImagePath,
              width: context.getWidth(per: 2),
              height: context.getHeight(per: 2),
            ),
          ),
          
        ]
)

,
                ))
                
                
                ]
              ),
            ),
          ],
        ),


      );
  }
}