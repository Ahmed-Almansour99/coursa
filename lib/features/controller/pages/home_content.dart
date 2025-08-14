import 'package:coursa/core/functions/get_end.dart';
import 'package:coursa/core/functions/get_start.dart';
import 'package:coursa/core/functions/navigation.dart';
import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/features/about/about_page.dart';
import 'package:coursa/features/controller/wedget/home_container_wedget.dart';
import 'package:coursa/features/controller/wedget/long_shimmer.dart';
import 'package:coursa/features/language/language_page.dart';
import 'package:coursa/features/my_certificate/my_certeficates_page.dart';
import 'package:coursa/features/my_goals/my_goals_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coursa/core/extensions/screen/screen_size.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:coursa/features/my_courses/my_courses_page.dart';
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
   bool isLoading = true;
late int goalsStart;
late int goalsEnd;
late int coursesStart;
late int coursesEnd;
late int certeficatesStart;
late int certeficatesEnd;
late int achievementsStart;
late int achievementsEnd;
  @override
  void initState() {
    super.initState();
     updateAllProgress(); 
    Future.wait([getStart('goals'), getEnd('goals'),getStart('courses'), getEnd('courses'),getStart('certeficates'), getEnd('certeficates'),getStart('achievements'), getEnd('achievements')]).then((values) {
    setState(() {
      goalsStart = values[0];
      goalsEnd   = values[1];
      coursesStart = values[2];
      coursesEnd = values[3];
      certeficatesStart = values[4];
      certeficatesEnd = values[5];
      achievementsStart = values[6];
      achievementsEnd = values[7];
      
      });});
    //make delay for shimmer
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppPalette.greylight,appBar: AppBar(backgroundColor:  AppPalette.whiteColor,centerTitle: true,title: Text(AppText.projectTitle,style: Theme.of(context).textTheme.titleLarge,),actions: [IconButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(onTap: () {pushNavigator(context, LanguagePage(fromHome:true));}, child: Text(AppText.changeLangugue.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic))),
          
             
            ],
          ),
        );
      },
    );
  },
  icon: Icon(Icons.settings),
)
],),body: Column(
            children: [
              Expanded(
                child: ListView(
                          padding: EdgeInsets.zero,
        children: [
          if (isLoading)                     // shimmer
            ...List.generate(4, (_) => buildLongShimmerItem(context))
          else
            ...[
           
         HomeContainer(page:  MyGoalsPage(),file: 'goals',title: AppText.homeContainer1Title.tr(),image: 'goals.png',start: goalsStart,end: goalsEnd,onProgressUpdated: updateAllProgress),
HomeContainer(page:  MyCoursesPage(),file: 'courses',title: AppText.homeContainer2Title.tr(),image: 'book.png',start: coursesStart,end: coursesEnd,onProgressUpdated: updateAllProgress),
HomeContainer(page:  MyCerteficatesPage(),file: 'certeficates',title: AppText.homeContainer3Title.tr(),image: 'certifecate_center.png',start: certeficatesStart,end: certeficatesEnd,onProgressUpdated: updateAllProgress),
HomeContainer(page: null,file: 'achievements',title: AppText.homeContainer4Title.tr(),image: 'achievement.png',start: achievementsStart,end: achievementsEnd,onProgressUpdated: updateAllProgress),
                  
            ],
        ],
      ),
    ),
  ],
)     
     
     
     
     
     
     
     
     
     
     
     ,drawer:Drawer(child: SafeArea(child: Padding(
       padding: EdgeInsets.symmetric(vertical: context.getWidth(per: 3)),
       child: Column(children: [SizedBox(height: 2,),InkWell(onTap: () {pushNavigator(context, AboutPage());},child: 
       Container(alignment: Alignment.centerLeft,decoration:BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey),top: BorderSide.none,left: BorderSide.none,right: BorderSide.none,)),height: context.getHeight()*0.07,child: 
       Padding(
         padding: EdgeInsets.symmetric(horizontal: context.getWidth()*0.03),
         child: Text(AppText.aboutTheInstitute.tr(),),
       )))],),
     )),) ,);
  }
  Future<void> updateAllProgress() async {
  final values = await Future.wait([
    getStart('goals'), getEnd('goals'),
    getStart('courses'), getEnd('courses'),
    getStart('certeficates'), getEnd('certeficates'),
    getStart('achievements'), getEnd('achievements')
  ]);

  if (!mounted) return;

  setState(() {
    goalsStart = values[0];
    goalsEnd = values[1];
    coursesStart = values[2];
    coursesEnd = values[3];
    certeficatesStart = values[4];
    certeficatesEnd = values[5];
    achievementsStart = values[6];
    achievementsEnd = values[7];
  });
}

}

