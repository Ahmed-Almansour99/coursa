import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/features/controller/wedget/course_container.dart';
import 'package:coursa/features/controller/wedget/shimmer.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
class CoursesContent extends StatefulWidget {
  const CoursesContent({super.key});

  @override
  State<CoursesContent> createState() => _CoursesContentState();
}

class _CoursesContentState extends State<CoursesContent> {
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
                      : [ CourseContainer(imagePath: AppText.course1ImagePath, title: AppText.course1Title.tr(), subtitle:AppText.course1SubTitle.tr()),
                      CourseContainer(imagePath: AppText.course2ImagePath, title: AppText.course2Title.tr(), subtitle: AppText.course2SubTitle.tr()),
                      CourseContainer(imagePath: AppText.course3ImagePath, title: AppText.course3Title.tr(), subtitle: AppText.course3SubTitle.tr()),
                      CourseContainer(imagePath: AppText.course4ImagePath, title: AppText.course4Title.tr(), subtitle: AppText.course4SubTitle.tr())
                      ]))
      
      
      ],)
      
      
      ),
    );
  }
}