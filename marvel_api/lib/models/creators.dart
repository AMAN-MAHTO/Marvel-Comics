import 'package:marvel_api/models/items3.dart';

class Creators {
  final int? available;
  final String? collectionURI;
  final List<Items3>? items;
  final int? returned;

  Creators(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory Creators.fromMap(Map<String, dynamic> json) {
    var items = <Items3>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(Items3.fromMap(v));
      });
    }
    return Creators(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: items,
        returned: json['returned']);
  }
}
