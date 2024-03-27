import 'items2.dart';

class Comics {
  final int available;
  final String collectionURI;
  final List<Items2> items;
  final int returned;

  Comics(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory Comics.fromMap(Map<String, dynamic> json) {
    var items = <Items2>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new Items2.fromMap(v));
      });
    }
    return Comics(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: items,
        returned: json['returned']);
  }
}
