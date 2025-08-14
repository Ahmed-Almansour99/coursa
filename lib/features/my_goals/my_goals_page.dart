import 'dart:convert';
import 'dart:io';
import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyGoalsPage extends StatefulWidget {
  const MyGoalsPage({super.key});

  @override
  State<MyGoalsPage> createState() => _MyGoalsPageState();
}

class _MyGoalsPageState extends State<MyGoalsPage> {
  final TextEditingController goalcontroller = TextEditingController();
  late File file;
  List<Map<String, dynamic>> goals = []; 
  late File file2;
  List<Map<String, dynamic>> achievements = []; 
bool dataChanged = false;          

  void editGoals() {
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
    file = File('${dir.path}/goals.json');
    file2 = File('${dir2.path}/achievements.json');
    if (await file.exists()) {
      final data = jsonDecode(await file.readAsString()) as List;
      
      goals = data.map((e) => Map<String, dynamic>.from(e)).toList();
      
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

  Future<void> saveGoals() async {
    await file.writeAsString(jsonEncode(goals));
  }
Future<void> saveAchievements() async {
    await file2.writeAsString(jsonEncode(achievements));
  }
  void addGoal() {
    addAchievement();
    final text = goalcontroller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      goals.add({'title': text, 'done': false});
      goalcontroller.clear();

    });
          editGoals();
    saveGoals();
    
  }
  void addAchievement() {
    final text = goalcontroller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      achievements.add({'title': text,'source':'goals' , 'done': false});

    });
  
    saveAchievements();
    
  }

  void toggleDone(int index, bool? value) {
    setState(() {
      goals[index]['done'] = value ?? false;
       final goalsTitle = goals[index]['title'];
    for (var achievement in achievements) {
      if (achievement['title'] == goalsTitle && achievement['source'] == 'goals') {
        achievement['done'] = value ?? false;
        break;
      }
    }
  });
     editGoals();
    saveGoals();
    saveAchievements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(AppText.myGoals.tr()),leading: BackButton(onPressed: () {Navigator.pop(context, dataChanged); })),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: goalcontroller,
                    decoration:  InputDecoration(
                      hintText: AppText.enterYourGoal.tr(),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => addGoal(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addGoal,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: goals.isEmpty
                  ?  Center(child: Text(AppText.addSomeGoalsHere.tr()))
                  : ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (context, i) {
                        final goal = goals[i];
                        return CheckboxListTile(
                          title: Text(
                            goal['title'],
                            style: TextStyle(
                              decoration: goal['done']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          value: goal['done'],
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
