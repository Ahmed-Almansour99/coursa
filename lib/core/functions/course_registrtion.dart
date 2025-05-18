import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
  late File file;
  List<Map<String, dynamic>> courses = []; 
      late File file2;
  List<Map<String, dynamic>> achievements = []; 
courseRegistrtion(title)async{
await initFile();
addcourse(title);
addAchievement(title);
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
    
  }
  Future<void> savecourses() async {
    await file.writeAsString(jsonEncode(courses));
  }

  void addcourse(title) {
    final text = title;
    if (text.isEmpty) return;
    
      courses.add({'title': text, 'done': false});
      
    
    savecourses();
  }
  Future<void> saveAchievements() async {
    await file2.writeAsString(jsonEncode(achievements));
  }
  void addAchievement(title) {
    
    if (title.isEmpty) return;
    
      achievements.add({'title': title,'source':'courses' ,'done': false});

    
  
    saveAchievements();
    
  }