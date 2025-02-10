import 'models.dart';

class CAddressGenerator {
  CAddressMath vaddressMath;

  CAddressGenerator({CAddressMath? addressBase}) : vaddressMath = addressBase ?? CAddressMath();

  CAddressTables lgenerateEntries({
    required int addressStart,
    required int byteNode,
    required int valueSwitch,
    required int offsetBit,
    required CModels_Groups groups,
    required String value,
  }) {
    var entries = CAddressTables();

    for (int i = 0; i < 4; i++) {
      String address = vaddressMath.lCovParAddress(
        addressStart: addressStart,
        byteNode: byteNode,
        valueSwitch: valueSwitch,
        offsetBit: offsetBit + i,
      );

      if (i < groups.vinputs.length) {
        var input = groups.vinputs[i];
        if (input.vname.isNotEmpty && value.isNotEmpty) {
          entries.addInput(CAddressTable(
            name: '${input.vname}$value',
            address: 'I$address',
            comment: '${input.vcomment}$value',
          ));
        }
      }

      if (i < groups.voutputs.length) {
        var output = groups.voutputs[i];
        if (output.vname.isNotEmpty && value.isNotEmpty) {
          entries.addOutput(CAddressTable(
            name: '${output.vname}$value',
            address: 'Q$address',
            comment: '${output.vcomment}$value',
          ));
        }
      }
    }

    return entries;
  }
}

class CAddressMath {
  // 改为 CAddressBase
  CAddressMath();

  String lCovParAddress({
    required int addressStart,
    required int byteNode,
    required int valueSwitch,
    required int offsetBit,
  }) {
    int address = addressStart + (byteNode ~/ 2) + valueSwitch * 16;
    int bit = (byteNode * 4 + offsetBit) % 8;
    return '$address.$bit';
  }
}

class CAddressTable {
  final String name;
  final String address;
  final String comment;
  final String type = 'Bool';
  final bool defaultValue = false;
  final bool readable = true;
  final bool writable = true;
  final bool retentive = true;

  CAddressTable({
    required this.name,
    required this.address,
    required this.comment,
  });

  @override
  String toString() {
    return '$name\t$type\t$address\t$defaultValue\t$readable\t$writable\t$retentive\t\t$comment';
  }
}

class CAddressTables {
  final List<CAddressTable> inputs = [];
  final List<CAddressTable> outputs = [];

  void addInput(CAddressTable entry) => inputs.add(entry);

  void addOutput(CAddressTable entry) => outputs.add(entry);

  List<CAddressTable> getAllEntries() {
    List<CAddressTable> allEntries = [];

    // 添加所有输入条目
    inputs.forEach((input) {
      allEntries.add(input);
    });

    // 添加所有输出条目
    outputs.forEach((output) {
      allEntries.add(output);
    });

    return allEntries;
  }

  List<String> getFormattedEntries() => getAllEntries().map((e) => e.toString()).toList();
}
