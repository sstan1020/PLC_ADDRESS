import 'dart:io';
import 'dart:convert';
import 'models.dart'; // 假设您的模型类在这个位置
import 'package:flutter4/models/RegExpPattern.dart';
import 'package:flutter4/models/Address.dart';

// void processVEntries(List<Map<String, dynamic>> ventries, CRegExps RegExps, CModels_Sections sections) {
//   ventries.forEach((entry) {
//     entry.forEach((key, value) {
//       String valueString = value.toString();

//       // 检查值是否为空
//       if (valueString.isNotEmpty) {
//         print('Key number: $key');
//         print('big Value: $valueString');

//         CRegExpResult regextresult = RegExps.parse(valueString);
//         print('Key: ${regextresult.key}');
//         print('Value: ${regextresult.value}');

//         // 检查sections中是否包含该key
//         if (sections.vsections.containsKey(regextresult.key)) {
//           CModels_Groups group = sections.vsections[regextresult.key]!;

//           // 生成地址条目
//           var addressgen = CAddressGenerator();
//           var entries = addressgen.lgenerateEntries(
//             addressStart: 1200,
//             byteNode: int.parse(key),
//             valueSwitch: 1,
//             offsetBit: 4,
//             groups: group,
//             value: regextresult.value,
//           );

//           // 打印条目
//           entries.getFormattedEntries().forEach((element) {
//             print(element);
//           });
//         }
//         print('-------------------');
//       }
//     });
//   });
// }

class JsonService {
  // 文件路径作为参数传入，而不是硬编码
  static String getJsonFilePath(String Path_Name, String File_Name) {
    // 从项目根目录开始的相对路径
    return '$Path_Name/$File_Name.json';
  }

  // 通用的 JSON 字符串加载方法
  static Future<String?> loadJsonString({
    required String Name_Path,
    required String Name_File,
  }) async {
    try {
      final file = File('$Name_Path$Name_File.json');
      if (!await file.exists()) {
        print('File not found: ${file.path}');
        return null;
      }
      return await file.readAsString();
    } catch (e) {
      print('Error loading JSON: $e');
      return null;
    }
  }

  // 将 JSON 字符串解码为 Map<String, dynamic>
  static dynamic decodeJsonString({required String jsonString}) {
    try {
      return json.decode(jsonString);
    } catch (e) {
      print('Error decoding JSON string: $e');
      return null;
    }
  }

  // 使用 loadJsonString 重构 loadSectionIO
  static Future<CModels_Sections?> loadSectionIO({
    required String Name_Path,
    required String Name_File,
  }) async {
    try {
      final jsonString = await loadJsonString(
        Name_Path: Name_Path,
        Name_File: Name_File,
      );

      if (jsonString == null) return null;

      // 尝试解析 JSON 以验证格式
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // 转换为 CSection_IO 对象
      return CModels_Sections.fromJson(jsonMap);
    } catch (e) {
      print('Error parsing Section IO: $e');
      // 添加更详细的错误信息
      if (e is FormatException) {
        print('JSON 格式错误: ${e.message}');
        print('错误位置: ${e.offset}');
      }
      return null;
    }
  }
}
