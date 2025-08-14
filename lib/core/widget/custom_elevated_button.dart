import 'package:coursa/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(backgroundColor: AppPalette.beigeColor  ),child: Text(text,style:  TextStyle(color: AppPalette.whiteColor)));
  }
}
