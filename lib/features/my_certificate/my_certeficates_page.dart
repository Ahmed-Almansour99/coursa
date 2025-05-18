import 'package:coursa/core/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class MyCerteficatesPage extends StatefulWidget {
  const MyCerteficatesPage({super.key});

  @override
  State<MyCerteficatesPage> createState() => _MyCerteficatesPageState();
}

class _MyCerteficatesPageState extends State<MyCerteficatesPage> {
 late File file;
  List<Map<String, dynamic>> certeficates = []; 
    late File file2;
  List<Map<String, dynamic>> achievements = []; 
 bool dataChanged = false;          

  void editcerteficate() {
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
    file = File('${dir.path}/certeficates.json');
    file2 = File('${dir2.path}/achievements.json');
    if (await file.exists()) {
      final data = jsonDecode(await file.readAsString()) as List;
      certeficates = data.map((e) => Map<String, dynamic>.from(e)).toList();
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

  Future<void> savecerteficates() async {
    await file.writeAsString(jsonEncode(certeficates));
  }

  Future<void> saveAchievements() async {
    await file2.writeAsString(jsonEncode(achievements));
  }

  void toggleDone(int index, bool? value) {
  setState(() {
    certeficates[index]['done'] = value ?? false;


    final certeficateTitle = certeficates[index]['title'];
    for (var achievement in achievements) {
      if (achievement['title'] == certeficateTitle && achievement['source'] == 'certeficates') {
        achievement['done'] = value ?? false;
        break;
      }
    }
  });

  editcerteficate();
  savecerteficates();
  saveAchievements();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.myCerteficates.tr(),),leading: BackButton(onPressed: () {Navigator.pop(context, dataChanged); })),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
     
            const SizedBox(height: 20),
            Expanded(
              child: certeficates.isEmpty
                  ?  Center(child: Text(AppText.noCerteficatesYet.tr()))
                  : ListView.builder(
                      itemCount: certeficates.length,
                      itemBuilder: (context, i) {
                        final certeficate = certeficates[i];
                        return CheckboxListTile(
                          title: Text(
                            certeficate['title'],
                            style: TextStyle(
                              decoration: certeficate['done']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          value: certeficate['done'],
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
