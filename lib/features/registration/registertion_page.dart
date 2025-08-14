import 'package:coursa/core/functions/certeficate_registrtion.dart';
import 'package:coursa/core/functions/course_registrtion.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/core/widget/custom_text_field.dart';
import 'package:coursa/features/controller/controller_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/theme/app_palette.dart';

class RegistrtionScreen extends StatelessWidget {
  const RegistrtionScreen({super.key, required this.title, required this.source});
  final String title;
  final String source;
  

  @override
  Widget build(BuildContext context) {
     final registrtionFormkey = GlobalKey<FormState>();
 final TextEditingController nameController =TextEditingController();
 final TextEditingController ageController =TextEditingController();
 final TextEditingController natuionalIdController =TextEditingController();
    return  Scaffold(
      appBar: AppBar(title: Text(AppText.regisertionTitle.tr()),centerTitle: true,),
body: SafeArea(child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Form(key:registrtionFormkey ,
    child: Column(children: [
    CustomTextField(text:AppText.name.tr(),controllers:nameController ,condition: (value) {
  if (value == null || value.isEmpty){
    return 'name is required';
  }
  return null;
} ,),
     CustomTextField(text:AppText.age.tr(),controllers:ageController ,condition: (value) {
  if (value == null || value.isEmpty){
    return 'age is required';
  }else if(int.tryParse(value) == null ){

    return 'Please Enter  Numbers';
  }
  
  else if(int.tryParse(value) != null ){
if(value<15){
  return 'Age is less than required';
}
  }
  return null;
} ,),
 CustomTextField(text:AppText.natuionalID.tr(),controllers:natuionalIdController ,condition: (value) {
  if (value == null || value.isEmpty){
    return 'natuionalID is required';
  }else if(int.tryParse(value) == null ){

    return 'Please Enter  Numbers';
  }
  
  else if(int.tryParse(value) != null ){
if(value.length != 10){
  return '10 digits required';
}
  }
  return null;
} ,),
    
    ElevatedButton(onPressed: ()async{
      if (registrtionFormkey.currentState!.validate()) {
    await Future.delayed(Duration(milliseconds: 500));
    if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              AppText.regisertionTitle.tr(),
              style: TextStyle(color: AppPalette.primryText),
            ),
            content: Text(
              source ==AppText.courses ?
              AppText.courseConfrim.tr()
              :
              AppText.certeficateConfrim,
              style: TextStyle(color: AppPalette.primryText),
            ),
            actions: [
              TextButton(
                onPressed: () {
                 
                  Navigator.of(context).pop(); 
                },
                child: Text(AppText.no.tr(), style: TextStyle(color: AppPalette.primryText)),
              ),
              TextButton(
                onPressed: () async{
                  source == AppText.courses ?
                  await courseRegistrtion(title)
                  :
                  await certeficateRegistrtion(title);
                 if (!context.mounted){
                 return;
                 }
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationController()));
                
                },
                child: Text(AppText.yes.tr(), style: TextStyle(color: AppPalette.beigeColor)),
              ),
            ],
          );
        },
      );}}, child: Text(AppText.confirm.tr()))
    
    
      
    ],),
  ),
)),





    );
  }
}