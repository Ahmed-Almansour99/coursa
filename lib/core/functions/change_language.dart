 

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
Future<void> changeLanguage(BuildContext context, String ln) async {
  
  await context.setLocale(Locale(ln));
}