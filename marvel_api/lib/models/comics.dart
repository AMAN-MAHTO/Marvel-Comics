class Comics {
  final int available;
  final String collectionURI;
  final List<Items> items;
  final int returned;

  Comics(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory Comics.fromMap(Map<String, dynamic> json) {
    var items = <Items>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new Items.fromMap(v));
      });
    }
    return Comics(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: items,
        returned: json['returned']);
  }
}

class Items {
  String? resourceURI;
  String? name;

  Items({required this.resourceURI, required this.name});

  factory Items.fromMap(Map<String, dynamic> json) {
    return Items(resourceURI: json['resourceURI'], name: json['name']);
  }
}
