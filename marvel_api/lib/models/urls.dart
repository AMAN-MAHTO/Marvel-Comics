class Urls {
  final String? type;
  final String? url;

  Urls({required this.type, required this.url});

  factory Urls.fromMap(Map<String, dynamic> json) {
    return Urls(type: json['type'], url: json['url']);
  }
}
