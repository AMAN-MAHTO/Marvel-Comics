class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({required this.path, required this.extension});

  factory Thumbnail.fromMap(Map<String, dynamic> json) {
    return Thumbnail(path: json['path'], extension: json['extension']);
  }

  String imgUrl() {
    return "${this.path}.${this.extension}";
  }
}
