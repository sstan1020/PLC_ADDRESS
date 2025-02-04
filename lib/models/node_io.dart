class CNode_IO {
  final String vname;
  final String vcomment;

  CNode_IO({required this.vname, required this.vcomment});

  factory CNode_IO.fromJson(Map<String, dynamic> json) {
    return CNode_IO(
      vname: json['Name']?.toString() ?? '',
      vcomment: json['Comment']?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return 'Name : $vname Comment : $vcomment';
  }
}
