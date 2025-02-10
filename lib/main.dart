import 'models/RegExpPattern.dart';
import 'models/nodes.dart';
import 'models/models.dart';
import 'models/process.dart';

void main() async {
  CNodes nodes = await processNodes(
      Name_Path: 'lib/json_data/',
      Name_File: 'NodesPLC17_ASI703B',
      isPrint: false);
  CModels_Sections sections = await processSections(
      Name_Path: 'lib/json_data/', Name_File: 'Models', isPrint: false);
  CRegExps RegExps = await processRegExp(
      Name_Path: 'lib/json_data/', Name_File: 'RegExps', isPrint: false);
  processVEntries(
      nodes: nodes,
      sections: sections,
      RegExps: RegExps,
      isPrintTitle: false,
      isPrintContent: true,
      addressStart: 1200,
      valueSwitch: 1,
      offsetBit: 4,
      start: 4,
      end: -1);
}




























  // await example_RegExp();
  // await exampleNodesUsage();
  // await Example_loadModels();

  // dynamic jsonStringRegExps = await JsonService.loadJsonString(
  //   Name_Path: 'lib/json_data/',
  //   Name_File: 'RegExps',
  // );

  // dynamic jsonDataRegExps = JsonService.decodeJsonString(jsonStringRegExps!);
  // CRegExps RegExps = CRegExps.fromJson(jsonDataRegExps);

  // dynamic jsonStringNodes = await JsonService.loadJsonString(
  //   Name_Path: 'lib/json_data/',
  //   Name_File: 'nodes',
  // );

  // dynamic jsonDataNodes = JsonService.decodeJsonString(jsonStringNodes!);

  // CNodes nodes = CNodes.fromJson(jsonDataNodes);

  // dynamic jsonStringModels = await JsonService.loadJsonString(
  //   Name_Path: 'lib/json_data/',
  //   Name_File: 'Models',
  // );

  // dynamic jsonDataModels = JsonService.decodeJsonString(jsonStringModels!);

  // CModels_Sections sections = CModels_Sections.fromJson(jsonDataModels);

  // processVEntries(nodes.ventries, RegExps, sections);

  // nodes.ventries.forEach((element) {
  //   element.forEach((key, value) {
  //     if (value.toString().isNotEmpty) {
  //       print('Key number: $key');
  //       print('big Value: $value');
  //       CRegExpResult regextresult = RegExps.parse(value);
  //       print('Key: ${regextresult.key}');
  //       print('Value: ${regextresult.value}');

  //       if (sections.vsections.containsKey(regextresult.key)) {
  //         CModels_Groups group = sections.vsections[regextresult.key]!;
  //         // group.vinputs.forEach((element) {
  //         //   print('Input: ${element.toString()}');
  //         // });
  //         // group.voutputs.forEach((element) {
  //         //   print('Output: ${element.toString()}');
  //         // });
  //         var addressgen = CAddressGenerator();
  //         var entries = addressgen.lgenerateEntries(
  //           addressStart: 1200,
  //           byteNode: int.parse(key),
  //           valueSwitch: 1,
  //           offsetBit: 4,
  //           groups: group,
  //           value: regextresult.value,
  //         );

  //         entries.getFormattedEntries().forEach((element) {
  //           print('${element}');
  //           ;
  //         });
  //       }
  //       print('-------------------');
  //     }
  //   });
  // });