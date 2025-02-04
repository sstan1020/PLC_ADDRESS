// import 'dart:convert';
// import 'dart:io';
// import 'models/section_io.dart';
import 'services/json_service.dart';

Future<String> loadMessage() async {
  // 延迟2秒，模拟耗时操作
  await Future.delayed(Duration(seconds: 2));
  return '你好，这是异步消息';
}

void main() async {
  // 读取 node.json 为字符串
  final jsonString = await JsonService.loadJsonString(
    Name_Path: 'lib/json_data/',
    Name_File: 'nodes',
  );

  print(jsonString);

  // final section = await JsonService.loadSectionIO(
  //   Name_Path: 'lib/json_data/',
  //   Name_File: 'Models',
  // );

  // print(section?.vgroups['DFI_CI']?.vinputs[0].toString());
}
