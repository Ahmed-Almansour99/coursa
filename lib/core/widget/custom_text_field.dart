import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, required this.controllers, this.condition, this.obscureText =false});
  final String text;
  final TextEditingController controllers ;
  final FormFieldValidator? condition ;
final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controllers ,decoration: InputDecoration(hintText: text ,),obscureText: obscureText,validator: condition,);
  }
}
