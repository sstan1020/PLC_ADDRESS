// // 读取并解析数据
// Future<CSection_IO> readAndParseJson() async {
//   final file = File(
//       'd:/VS Code/flutter4/lib/json_data/asi/user1/project1/template_IO.json');
//   var jsonString = await file.readAsString();

//   // 移除末尾的分号（如果存在）
//   jsonString = jsonString.trim();
//   if (jsonString.endsWith(';')) {
//     jsonString = jsonString.substring(0, jsonString.length - 1);
//   }

//   final jsonData = json.decode(jsonString);
//   return CSection_IO.fromJson(jsonData);
// }

// void main() async {
//   final section = await readAndParseJson();
//   print(section.vgroups['DFI_CI']!.vinputs[0].toString());
// }
Future<String> prepareFood() async {
  print('厨师开始做菜');
  await Future.delayed(Duration(seconds: 3)); // 模拟做菜时间
  return '一盘宫保鸡丁';
}

Future<String> prepareDrink() async {
  print('服务员准备饮料');
  await Future.delayed(Duration(seconds: 1)); // 模拟准备饮料时间
  return '一杯可乐';
}

void main() async {
  print('开始点餐');

  // Future.wait 可以同时处理多个异步操作
  final results = await Future.wait([prepareFood(), prepareDrink()]);

  print('您的餐品准备好了：${results[0]} 和 ${results[1]}');
}
