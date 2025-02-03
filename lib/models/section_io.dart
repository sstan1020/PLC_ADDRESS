import 'group_io.dart';

class CSection_IO {
  final Map<String, CGroup_IO> vgroups;

  CSection_IO({required this.vgroups});

  factory CSection_IO.fromJson(Map<String, dynamic> json) {
    Map<String, CGroup_IO> groups = {};
    json.forEach((key, value) {
      groups[key] = CGroup_IO.fromJson(value);
    });
    return CSection_IO(vgroups: groups);
  }

  CGroup_IO? getGroup(String key) {
    return vgroups[key];
  }
}
