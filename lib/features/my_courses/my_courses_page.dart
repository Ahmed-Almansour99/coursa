import 'dart:convert';
import 'dart:io';
import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  
  late File file;
  List<Map<String, dynamic>> courses = []; 
    late File file2;
  List<Map<String, dynamic>> achievements = []; 
 bool dataChanged = false;          

  void editCourse() {
    setState(() => dataChanged = true);
  }
  @override
  void initState() {
    super.initState();
    initFile();
  }

  Future<void> initFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final dir2 = await getApplicationDocumentsDirectory();
    file = File('${dir.path}/courses.json');
    file2 = File('${dir2.path}/achievements.json');
    if (await file.exists()) {
      final data = jsonDecode(await file.readAsString()) as List;
      courses = data.map((e) => Map<String, dynamic>.from(e)).toList();
    }else {
      await file.writeAsString('[]');
      
    }
    
    
     if(await file2.exists()){
final data2 = jsonDecode(await file2.readAsString()) as List;
      achievements = data2.map((e) => Map<String, dynamic>.from(e)).toList();

    } else {
      
      await file2.writeAsString('[]');
    }
    setState(() {});
  }

  Future<void> savecourses() async {
    await file.writeAsString(jsonEncode(courses));
  }

  Future<void> saveAchievements() async {
    await file2.writeAsString(jsonEncode(achievements));
  }

  void toggleDone(int index, bool? value) {
  setState(() {
    courses[index]['done'] = value ?? false;


    final courseTitle = courses[index]['title'];
    for (var achievement in achievements) {
      if (achievement['title'] == courseTitle && achievement['source'] == 'courses') {
        achievement['done'] = value ?? false;
        break;
      }
    }
  });

  editCourse();
  savecourses();
  saveAchievements();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(AppText.myCourses.tr(),),leading: BackButton(onPressed: () {Navigator.pop(context, dataChanged); })),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
     
            const SizedBox(height: 20),
            Expanded(
              child: courses.isEmpty
                  ?  Center(child: Text(AppText.noCoursesYet.tr()))
                  : ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, i) {
                        final course = courses[i];
                        return CheckboxListTile(
                          title: Text(
                            course['title'],
                            style: TextStyle(
                              decoration: course['done']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          value: course['done'],
                          onChanged: (val) => toggleDone(i, val),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
