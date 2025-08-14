import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

Future<int> getEnd(String filename) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$filename.json');

  
  if (!await file.exists()) {
    return 0;
  }

  try {
    final contents = await file.readAsString();
    final List<dynamic> filecontents = json.decode(contents);


    int doneCount = filecontents.where((fileContent) => fileContent['done'] == true || fileContent['done'] == false ).length;

    return doneCount;
  } catch (e) {
    
    return 0;
  }
}
