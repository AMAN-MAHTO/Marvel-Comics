class Items3 {
  String? resourceURI;
  String? name;
  String? type;

  Items3({required this.resourceURI, required this.name, required this.type});

  factory Items3.fromMap(Map<String, dynamic> json) {
    return Items3(
        resourceURI: json['resourceURI'],
        name: json['name'],
        type: json['type']);
  }
}
