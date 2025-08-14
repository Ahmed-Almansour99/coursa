
import 'package:coursa/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.whiteColor,
    appBarTheme: AppBarTheme(backgroundColor: AppPalette.beigeLight),
    // drawerTheme: DrawerThemeData(),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.beigeColor,
        minimumSize: const Size(258, 44),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
    ),
    
  textTheme: TextTheme(
     titleSmall: TextStyle(color: AppPalette.seconderyText,fontSize: 14),
    titleMedium: TextStyle(color: AppPalette.primryText,fontSize: 16,fontWeight: FontWeight.bold),
titleLarge: TextStyle(color: AppPalette.seconderyText,fontSize: 18,fontWeight: FontWeight.bold),
labelSmall: TextStyle(color: AppPalette.seconderyText,fontSize: 6),
labelMedium: TextStyle(color: AppPalette.primryText,fontSize: 8),
labelLarge: TextStyle(color: AppPalette.seconderyText,fontSize: 11,fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color:AppPalette.seconderyText,fontSize: 11),
    bodyMedium: TextStyle(color:AppPalette.primryText,fontSize: 13),
    bodyLarge:  TextStyle(color:AppPalette.seconderyText,fontSize: 16,fontWeight: FontWeight.bold),
   
  ),
    
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDADADA)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDADADA)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDADADA), width: 1.5),
      ),
      hintStyle: TextStyle(
        color: AppPalette.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12),
    ),
  );
}
