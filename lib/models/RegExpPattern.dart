import 'dart:convert';
import 'dart:io';

// Future<void> example_RegExp() async {
//   // Load and parse JSON file containing RegExp patterns
//   final file = File('lib/json_data/RegExps.json');
//   var jsonString = await file.readAsString();
//   var jsonData = jsonDecode(jsonString);

//   // Create parser and parse some sample strings
//   var parser = CRegExps.fromJson(jsonData);
//   var examples = [
//     'CS1_CI68_01_7A',
//     'DFI_CI72_01',
//     'DFI1_TA01_07',
//     'RBFSD1_TA01_05_FSD'
//   ];

//   for (var text in examples) {
//     var result = parser.parse(text);
//     print('Input: $text');
//     print('Key: ${result.key}');
//     print('Value: ${result.value}\n');
//   }
// }

class CRegExpItem {
  final String vpattern;
  final List<int> vkeyIndices;
  final List<int> vvalueIndices;

  CRegExpItem({
    required this.vpattern,
    required this.vkeyIndices,
    required this.vvalueIndices,
  });

  factory CRegExpItem.fromJson(Map<String, dynamic> json) {
    return CRegExpItem(
      vpattern: json['RegExp'] as String,
      vkeyIndices: List<int>.from(json['Keys']),
      vvalueIndices: List<int>.from(json['Values']),
    );
  }
}

// 名称解析结果类
class CRegExpResult {
  final String key;
  final String value;

  CRegExpResult({required this.key, required this.value});

  bool get isEmpty => key.isEmpty && value.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '{key: $key, value: $value}';
  }
}

// 名称解析器类
class CRegExps {
  final List<CRegExpItem> vpatterns;

  CRegExps(this.vpatterns);

  factory CRegExps.fromJson(dynamic jsonData) {
    // 确保输入是List类型
    if (jsonData is! List) {
      throw FormatException('JSON数据必须是List类型');
    }

    List<CRegExpItem> patterns = [];

    // 遍历JSON数组
    jsonData.forEach((item) {
      if (item is Map<String, dynamic>) {
        patterns.add(CRegExpItem.fromJson(item));
      }
    });

    return CRegExps(patterns);
  }

  CRegExpResult parse(String name) {
    name = name.replaceAll('-', '_');

    for (var pattern in vpatterns) {
      RegExp exp = RegExp(pattern.vpattern);
      Match? match = exp.firstMatch(name);

      if (match != null) {
        String key = '';
        String value = '';

        pattern.vkeyIndices.forEach((i) => key += match.group(i) ?? '');
        pattern.vvalueIndices.forEach((i) => value += match.group(i) ?? '');

        return CRegExpResult(key: key, value: value);
      }
    }

    return CRegExpResult(key: '', value: '');
  }
}
