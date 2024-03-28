import 'package:marvel_api/models/items3.dart';

class ListType2 {
  final int? available;
  final String? collectionURI;
  final List<Items3>? items;
  final int? returned;

  ListType2(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory ListType2.fromMap(Map<String, dynamic> json) {
    var items = <Items3>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(Items3.fromMap(v));
      });
    }
    return ListType2(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: items,
        returned: json['returned']);
  }
}
