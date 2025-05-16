import 'package:flutter/material.dart';

void replacementNavigateor(context, Widget path) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => path),
  );
}

void pushNavigator(context, Widget path) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => path));
}
