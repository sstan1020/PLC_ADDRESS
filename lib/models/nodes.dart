class CNodes {
  List<Map<String, dynamic>> vnodes;

  CNodes({required List<Map<String, dynamic>> ventries}) : vnodes = ventries {
    if (ventries.isEmpty) {
      throw ArgumentError('entries cannot be empty');
    }
  }

  factory CNodes.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> nodesList = [];
    json.forEach((key, value) {
      nodesList.add({key: value});
    });
    return CNodes(ventries: nodesList);
  }

  Map<String, dynamic>? getValue(String key) {
    Map<String, dynamic>? result;
    vnodes.forEach((entry) {
      if (entry.containsKey(key)) {
        result = entry;
      }
    });
    return result;
  }

  @override
  String toString() {
    String result = '';
    vnodes.forEach((entry) {
      result += entry.toString() + '\n';
    });
    return result;
  }
}
