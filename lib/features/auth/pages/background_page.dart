import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/auth/widget/auth_widget.dart';
import 'package:flutter/material.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({super.key});

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  
  
  
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
       Container(height: context.getHeight(),width: context.getWidth(),decoration: BoxDecoration(gradient: 
       RadialGradient( 
        center: Alignment.center,
  radius: 0.55,
  colors: AppPalette.gradientlist,
  focal: Alignment.center,
  focalRadius: 0.9,)),),
          AuthWidget(),
          
        ],
      ),
    );
  }
}


