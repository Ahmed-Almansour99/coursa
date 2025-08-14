import 'package:coursa/core/theme/app_theme.dart';
import 'package:coursa/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'),Locale('en')],
      path: 'lib/core/text/translations',
      fallbackLocale: Locale('en'),
      child: const MainApp(),
    ),
  );
  
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
         theme: AppTheme.theme,
      home: SplashPage()
    );
  }
}
