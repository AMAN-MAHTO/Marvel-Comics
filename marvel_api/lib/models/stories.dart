import 'items3.dart';

class Stories {
  final int available;
  final String collectionURI;
  final List<Items3> items;
  final int returned;

  Stories(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory Stories.fromMap(Map<String, dynamic> json) {
    var items = <Items3>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new Items3.fromMap(v));
      });
    }
    return Stories(
        collectionURI: json['collectionURI'],
        available: json['available'],
        items: items,
        returned: json['returned']);
  }
}
