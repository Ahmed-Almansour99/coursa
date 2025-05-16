
import 'package:coursa/features/language/language_page.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
 
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   @override
 initState() {
    super.initState();
   
    Timer.periodic(Duration(seconds: 3), (time) {
      
      replacementNavigateor(context, LanguagePage());
    });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    
    Image.asset('assets/images/coursa.png',height:context.getHeight(),width: context.getWidth(),fit: BoxFit.contain,)
    );
  }
}