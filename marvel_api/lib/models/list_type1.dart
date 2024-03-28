import 'items2.dart';

class ListType1 {
  final int? available;
  final String? collectionURI;
  final List<Items2>? items;
  final int? returned;

  ListType1(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory ListType1.fromMap(Map<String, dynamic> json) {
    var items = <Items2>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new Items2.fromMap(v));
      });
    }
    return ListType1(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: items,
        returned: json['returned']);
  }
}
