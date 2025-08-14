import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/features/controller/wedget/certeficate_container.wedget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/features/controller/wedget/shimmer.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
class CerteficatesContent extends StatefulWidget {
  const CerteficatesContent({super.key});

  @override
  State<CerteficatesContent> createState() => _CerteficatesContentState();
}

class _CerteficatesContentState extends State<CerteficatesContent> {
    bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //make delay for shimmer
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: AppPalette.greylight,appBar: AppBar(backgroundColor: AppPalette.greylight,centerTitle: true,title: Text('Coursa'),),body:
      ListView(children: [
          SizedBox(
                height: context.getHeight(per:7.5),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 0.70,
                  children: isLoading
                  //simmer effect
                      ? List.generate(4, (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: buildShimmerItem(context),
                      ))
                      : [ 
                      CerteficateContainer(imagePath: AppText.certeficate1ImagePath, title: AppText.certeficate1Title.tr(), subtitle: AppText.certeficate1SubTitle),
                      CerteficateContainer(imagePath: AppText.certeficate2ImagePath, title: AppText.certeficate2Title.tr(), subtitle: AppText.certeficate2SubTitle),
                      CerteficateContainer(imagePath: AppText.certeficate3ImagePath, title: AppText.certeficate3Title.tr(), subtitle: AppText.certeficate3SubTitle),
                      CerteficateContainer(imagePath: AppText.certeficate4ImagePath, title: AppText.certeficate4Title.tr(), subtitle: AppText.certeficate4SubTitle)
                      ]))
      
      
      ],)
      
      
      ),
    );
  }
}