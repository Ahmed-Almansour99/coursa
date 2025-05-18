import 'package:flutter/material.dart';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/features/auth/pages/background_page.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.title, required this.bodyText, required this.buttonText});
final String title;
final String bodyText;
final String buttonText;
  @override
  Widget build(BuildContext context) {

    return Theme(
  data: Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme,
  ),
  child: AlertDialog(
                backgroundColor: Color.fromARGB(255, 37, 40, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: Text(
                  title,
                  
                  style: Theme.of(context).textTheme.titleMedium
                ),
                content: Text(
                  bodyText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      replacementNavigateor(context, BackgroundPage());
                    
                    },
                    child: Text(buttonText, style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
    );
  }
}
