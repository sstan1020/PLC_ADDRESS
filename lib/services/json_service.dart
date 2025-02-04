import 'dart:io';
import 'dart:convert';
import '../models/section_io.dart'; // 假设您的模型类在这个位置

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

  // 使用 loadJsonString 重构 loadSectionIO
  static Future<CSection_IO?> loadSectionIO({
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
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // 转换为 CSection_IO 对象
      return CSection_IO.fromJson(jsonMap);
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
