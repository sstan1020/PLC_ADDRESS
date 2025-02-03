import 'node_io.dart';

class CGroup_IO {
  final List<CNode_IO> vinputs;
  final List<CNode_IO> voutputs;

  CGroup_IO({required this.vinputs, required this.voutputs});

  factory CGroup_IO.fromJson(Map<String, dynamic> json) {
    List<CNode_IO> inputs = [];
    List<CNode_IO> outputs = [];

    if (json['INPUT'] != null) {
      for (var input in json['INPUT']) {
        inputs.add(CNode_IO.fromJson(input));
      }
    }

    if (json['OUTPUT'] != null) {
      for (var output in json['OUTPUT']) {
        outputs.add(CNode_IO.fromJson(output));
      }
    }

    return CGroup_IO(
      vinputs: inputs,
      voutputs: outputs,
    );
  }
}
