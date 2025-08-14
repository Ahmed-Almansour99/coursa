import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(AppText.about.tr()),),
      body: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
SizedBox(width: context.getWidth(),height: context.getHeight(per: 2),),
Padding(
  padding: EdgeInsets.symmetric(horizontal:  context.getShortest(per: 1)),
  child: Text(AppText.aboutTitle.tr(),textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleLarge,),
),
Container(
padding: EdgeInsets.all(context.getShortest(per: 1)),
width: context.getWidth(),
height: context.getHeight(per: 5),
alignment: Alignment.topCenter,
child: Text(AppText.aboutText.tr(),softWrap: true,),

)



    ],)),) ;
  }
}