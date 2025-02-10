import 'json_service.dart';

// Example usage function
// Future<void> exampleNodesUsage() async {
//   // Load and parse JSON data
//   dynamic jsonStringNodes = await JsonService.loadJsonString(
//     Name_Path: 'lib/json_data/',
//     Name_File: 'nodes',
//   );

//   dynamic jsonDataNodes = JsonService.decodeJsonString(jsonStringNodes!);

//   CNodes nodes = CNodes.fromJson(jsonDataNodes);

//   // Example 1: Print all nodes
//   print('All nodes:');
//   print(nodes.toString());
// }

class CNodes {
  List<Map<String, dynamic>> ventries;

  CNodes({required List<Map<String, dynamic>> ventries}) : ventries = ventries {
    if (ventries.isEmpty) {
      throw ArgumentError('entries cannot be empty');
    }
  }

  factory CNodes.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> nodesList = [];
    json.forEach((key, value) {
      nodesList.add({
        key: value
      });
    });
    return CNodes(ventries: nodesList);
  }

  Map<String, dynamic>? getValue(String key) {
    for (var entry in ventries) {
      if (entry.containsKey(key)) {
        return entry;
      }
    }
    return null;
  }

  @override
  String toString() {
    String result = '';
    ventries.forEach((entry) {
      result += entry.toString() + '\n';
    });
    return result;
  }
}
