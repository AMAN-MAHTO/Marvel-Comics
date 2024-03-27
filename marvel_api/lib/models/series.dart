class Series {
  String? resourceURI;
  String? name;

  Series({this.resourceURI, this.name});

  factory Series.fromMap(Map<String, dynamic> json) {
    return Series(resourceURI: json['resourceURI'], name: json['name']);
  }
}
