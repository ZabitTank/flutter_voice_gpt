class GPTModelInfo {
  final String id;
  final int created;
  final String root;

  GPTModelInfo({
    required this.id,
    required this.root,
    required this.created,
  });

  factory GPTModelInfo.fromJson(Map<String, dynamic> json) => GPTModelInfo(
        id: json["id"],
        root: json["root"],
        created: json["created"],
      );

  static List<GPTModelInfo> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => GPTModelInfo.fromJson(data)).toList();
  }
}
