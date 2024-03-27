class Items2 {
  String? resourceURI;
  String? name;

  Items2({required this.resourceURI, required this.name});

  factory Items2.fromMap(Map<String, dynamic> json) {
    return Items2(resourceURI: json['resourceURI'], name: json['name']);
  }
}
