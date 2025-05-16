import 'package:coursa/core/theme/app_palette.dart';
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
            border: Border.all(color: AppPalette.borderColor, width: 2),
            image: DecorationImage(
              image: AssetImage("assets/images/facebook.png"),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.borderColor, width: 2),
            
            ),
            child: IconButton(icon:Image.asset("assets/images/x.webp"),onPressed: (){},),
          
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppPalette.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.borderColor, width: 2),
            image: DecorationImage(image: AssetImage("assets/images/google.png")),
          ),
        ),
      ],
    );
  }
}
