import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

Future<int> getStart(String filename) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$filename.json');

  
  if (!await file.exists()) {
    return 0;
  }

  try {
    final contents = await file.readAsString();
    final List<dynamic> filecontents = json.decode(contents);


    int doneCount = filecontents.where((fileContent) => fileContent['done'] == true).length;

    return doneCount;
  } catch (e) {
    
    return 0;
  }
}
