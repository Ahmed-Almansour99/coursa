import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/features/about/about_page.dart';
import 'package:coursa/features/auth/pages/background_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
//ptofile content class
class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Scaffold(
      backgroundColor:AppPalette.greylight,
      //app bar for app
      appBar: AppBar(centerTitle: true,backgroundColor: AppPalette.greylight,title: Text(AppText.profile.tr(),style: TextStyle(color: AppPalette.greylight),),),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: context.getWidth(per:1)),
        child: Column(children: [
        SizedBox(width: context.getWidth(),height: context.getHeight(per:0.3),),
        //profile image
        Container(decoration: BoxDecoration(shape: BoxShape.circle,),child: Image.asset(AppText.avatarPath,width: context.getWidth(per:1.5),height: context.getHeight(per:1.5),),),
        SizedBox(height: context.getHeight(per:0.3),),
        Text(AppText.changeProfile.tr(),style: TextStyle(color: AppPalette.greylight),),
        //list tiles
        SizedBox(height: context.getHeight(per:0.3),),
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color:Colors.grey),child: Column(children: [
        Container(decoration: BoxDecoration(border:Border(bottom: BorderSide(color:AppPalette.greylight, width: 1),left: BorderSide.none,right: BorderSide.none,top: BorderSide.none,),),child:InkWell(onTap: () {pushNavigator(context, AboutPage());}, child: ListTile(leading: Image.asset(AppText.profileicon1),title:Text(AppText.about.tr(),style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),))),
        Container(decoration: BoxDecoration(border:Border(bottom: BorderSide.none,left: BorderSide.none,right: BorderSide.none,top: BorderSide.none,),),child:InkWell(onTap: () {replacementNavigateor(context, BackgroundPage());},child: ListTile(leading: Image.asset(AppText.profileicon2),title:Text(AppText.logout.tr(),style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),)))
        
        
        ],),)
        
        
        
        ],),
      ),
  ));
  }
}