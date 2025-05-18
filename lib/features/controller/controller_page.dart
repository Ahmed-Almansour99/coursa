


import 'package:coursa/core/text/app_text.dart';
import 'package:coursa/features/controller/pages/certeficates_content.dart';
import 'package:coursa/features/controller/pages/home_content.dart';
import 'package:coursa/features/controller/pages/courses_content.dart';
import 'package:coursa/features/controller/pages/profile_content.dart';
import 'package:coursa/core/theme/app_palette.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

//bottom navigation bar class
class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({super.key});

  @override
  State<BottomNavigationController> createState() => _BottomNavigationControllerState();
}

class _BottomNavigationControllerState extends State<BottomNavigationController> {
  // current index 0 represnt Descover
  int _currentIndex = 0;

  // pages 
  final List<Widget> _pages = [
  HomeContent(),
  CoursesContent(),
  CerteficatesContent(),
  ProfileContent()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppPalette.greylight,
        
        //start with current index home page
        body: _pages[_currentIndex],
        //coustmaize bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppPalette.beigeLight,
          selectedItemColor: AppPalette.black,
          unselectedItemColor:AppPalette.whiteColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          //elemants of navigation bar
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: AppText.navigationHome.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: AppText.navigationCourse.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: AppText.navigationCerteficate.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppText.navigationProfile.tr(),
            ),
            
          ],
        ),
      ),
    );
  }
}

