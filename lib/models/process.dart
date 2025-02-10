import 'dart:io';
import 'dart:convert';
import 'package:flutter4/models/RegExpPattern.dart';
import 'package:flutter4/models/Address.dart';
import 'package:flutter4/models/json_service.dart';
import 'package:flutter4/models/models.dart';
import 'package:flutter4/models/nodes.dart';

void processVEntries({
  required CNodes nodes,
  required CModels_Sections sections,
  required CRegExps RegExps,
  required bool isPrintTitle,
  required bool isPrintContent,
  int addressStart = 1200,
  int valueSwitch = 1,
  int offsetBit = 4,
  int start = 0, // 新增参数
  int end = -1, // 新增参数，-1 表示处理到最后
}) {
  if (end == -1) {
    end = nodes.ventries.length;
  }

  // nodes.ventries.forEach((entry) {
  for (int i = start; i < end; i++) {
    nodes.ventries[i].forEach((key, value) {
      // entry.forEach((key, value) {
      String valueString = value.toString();

      // 检查值是否为空
      if (valueString.isNotEmpty) {
        CRegExpResult regextresult = RegExps.parse(valueString);

        if (isPrintTitle) {
          print('Key number: $key');
          print('big Value: $valueString');
          print('Key: ${regextresult.key}');
          print('Value: ${regextresult.value}');
        }

        // 检查sections中是否包含该key
        if (sections.vsections.containsKey(regextresult.key)) {
          CModels_Groups group = sections.vsections[regextresult.key]!;

          // 生成地址条目
          CAddressGenerator addressgen = CAddressGenerator();
          CAddressTables addressTables = addressgen.lgenerateEntries(
            addressStart: addressStart,
            byteNode: int.parse(key),
            valueSwitch: valueSwitch,
            offsetBit: offsetBit,
            groups: group,
            value: regextresult.value,
          );

          // 打印条目
          if (isPrintContent) {
            addressTables.getFormattedEntries().forEach((element) {
              print(element);
            });
          }
        }
        if (isPrintTitle) {
          print('-------------------');
        }
      }
    });
  }
}

Future<CModels_Sections> processSections({required String Name_Path, required String Name_File, required bool isPrint}) async {
  dynamic jsonStringModels = await JsonService.loadJsonString(
    Name_Path: Name_Path,
    Name_File: Name_File,
  );
  dynamic jsonDataModels = JsonService.decodeJsonString(jsonString: jsonStringModels!);

  CModels_Sections sections = CModels_Sections.fromJson(jsonDataModels);
  // Print nested data
  if (isPrint) {
    sections.vsections.forEach((key, group) {
      print('Section Key: $key');
      group.vinputs.forEach((value) {
        print('Group Input: ${value.toString()}');
      });
      group.voutputs.forEach((value) {
        print('Group Output: ${value.toString()}');
      });
    });
  }
  return sections;
}

Future<CNodes> processNodes({required String Name_Path, required String Name_File, required bool isPrint}) async {
  // Load and parse JSON data
  dynamic jsonStringNodes = await JsonService.loadJsonString(
    Name_Path: Name_Path,
    Name_File: Name_File,
  );

  dynamic jsonDataNodes = JsonService.decodeJsonString(jsonString: jsonStringNodes!);
  CNodes nodes = CNodes.fromJson(jsonDataNodes);

  // Example 1: Print all nodes
  if (isPrint) {
    print('All nodes:');
    print(nodes.toString());
  }
  return nodes; // 返回CNodes对象
}

Future<CRegExps> processRegExp({required String Name_Path, required String Name_File, required bool isPrint}) async {
  dynamic jsonStringRegExps = await JsonService.loadJsonString(
    Name_Path: Name_Path,
    Name_File: Name_File,
  );

  dynamic jsonDataRegExps = JsonService.decodeJsonString(jsonString: jsonStringRegExps!);
  CRegExps RegExps = CRegExps.fromJson(jsonDataRegExps);

  if (isPrint) {
    print('RegExps Data:');
    RegExps.vpatterns.forEach((pattern) {
      print('Pattern: ${pattern.vpattern}');
      print('Key indices: ${pattern.vkeyIndices}');
      print('Value indices: ${pattern.vvalueIndices}');
    });

    var examples = [
      'CS1_CI68_01_7A',
      'DFI_CI72_01',
      'DFI1_TA01_07',
      'RBFSD1_TA01_05_FSD'
    ];

    print('-------------------');
    print('Examples:');
    for (var text in examples) {
      var result = RegExps.parse(text);
      print('Input: $text');
      print(result.toString());
    }
    print('-----------------');
  }
  return RegExps;
}
