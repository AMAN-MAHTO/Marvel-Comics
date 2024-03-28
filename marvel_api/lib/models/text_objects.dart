class TextObjects {
  final String? type;
  final String? language;
  final String? text;

  TextObjects({required this.type, required this.language, required this.text});

  factory TextObjects.fromMap(Map<String, dynamic> json) {
    return TextObjects(
      type: json['type'],
      language: json['language'],
      text: json['text'],
    );
  }
}
