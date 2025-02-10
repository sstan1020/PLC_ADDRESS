// Future<void> Example_loadModels() async {
//   // Load and parse models
//   dynamic jsonStringModels = await JsonService.loadJsonString(
//     Name_Path: 'lib/json_data/',
//     Name_File: 'Models',
//   );
//   dynamic jsonDataModels = JsonService.decodeJsonString(jsonStringModels!);
//   CModels_Sections sections = CModels_Sections.fromJson(jsonDataModels);

//   // Print nested data
//   sections.vsections.forEach((key, group) {
//     print('Section Key: $key');
//     group.vinputs.forEach((value) {
//       print('Group Input: ${value.toString()}');
//     });
//     group.voutputs.forEach((value) {
//       print('Group Output: ${value.toString()}');
//     });
//   });
// }

class CModels_Sections {
  final Map<String, CModels_Groups> vsections;

  CModels_Sections({required this.vsections});

  factory CModels_Sections.fromJson(Map<String, dynamic> json) {
    Map<String, CModels_Groups> groups = {};
    json.forEach((key, value) {
      groups[key] = CModels_Groups.fromJson(value);
    });
    return CModels_Sections(vsections: groups);
  }

  CModels_Groups? getGroup(String key) {
    return vsections[key];
  }
}

class CModels_Groups {
  final List<CModels_Node> vinputs;
  final List<CModels_Node> voutputs;

  CModels_Groups({required this.vinputs, required this.voutputs});

  factory CModels_Groups.fromJson(Map<String, dynamic> json) {
    List<CModels_Node> inputs = [];
    List<CModels_Node> outputs = [];

    if (json['INPUT'] != null) {
      json['INPUT'].forEach((input) {
        inputs.add(CModels_Node.fromJson(input));
      });
    }

    if (json['OUTPUT'] != null) {
      json['OUTPUT'].forEach((output) {
        outputs.add(CModels_Node.fromJson(output));
      });
    }

    return CModels_Groups(
      vinputs: inputs,
      voutputs: outputs,
    );
  }
}

class CModels_Node {
  final String vname;
  final String vcomment;

  CModels_Node({required this.vname, required this.vcomment});

  factory CModels_Node.fromJson(Map<String, dynamic> json) {
    return CModels_Node(
      vname: json['Name']?.toString() ?? '',
      vcomment: json['Comment']?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return 'Name : $vname Comment : $vcomment';
  }
}
