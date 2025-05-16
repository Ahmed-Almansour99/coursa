import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/auth/pages/login_page.dart';
import 'package:coursa/features/auth/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:easy_localization/easy_localization.dart';

 
class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: context.getHeight(per: 0.20)),
      child: ListView(
        children:[ Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.getWidth(per: 0.50)),
          child: DefaultTabController(
            length: 2,
            child: Center(
              child: Container(
                width: 360,
                height: 500,
                decoration: BoxDecoration(
                  color: AppPalette.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppPalette.black.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TabBar(
                        dividerHeight: 0,
                        indicatorColor: AppPalette.whiteColor,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                        indicator: BoxDecoration(
                          color: AppPalette.beigeColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        unselectedLabelColor: AppPalette.beigeColor,
                        labelColor: AppPalette.whiteColor,
                        indicatorSize: TabBarIndicatorSize.tab,
          
                        tabs: [Tab(text: AppText.logIn.tr()), Tab(text: AppText.signUp.tr())],
                      ),
                      Expanded(
                        child: TabBarView(children: [LoginPage(), SignupPage()]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
