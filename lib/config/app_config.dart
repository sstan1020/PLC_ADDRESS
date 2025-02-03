import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig extends GetxController {
  final appSettings = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadConfig() async {
    try {
      // 读取配置文件
      final String jsonString = await rootBundle.loadString('lib/config.json');
      final Map<String, dynamic> config = json.decode(jsonString);
      appSettings.value = config;
    } catch (e) {
      print('配置加载失败: $e');
      // 设置默认配置
      appSettings.value = {
        "appSettings": {
          "appName": "Flutter GetX Demo",
          "theme": {"primaryColor": "#2196F3", "isDarkMode": false}
        }
      };
    }
  }

  // 安全的getter方法
  String get baseUrl =>
      appSettings['appSettings']?['api']?['baseUrl'] ??
      'https://api.default.com';

  bool get isDarkMode =>
      appSettings['appSettings']?['theme']?['isDarkMode'] ?? false;

  String get defaultLanguage =>
      appSettings['appSettings']?['defaultLanguage'] ?? 'zh_CN';

  String get appName =>
      appSettings['appSettings']?['appName'] ?? 'Flutter GetX Demo';
}
