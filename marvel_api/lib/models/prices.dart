class Prices {
  final String? type;
  final String? price;

  Prices({required this.type, required this.price});

  factory Prices.fromMap(Map<String, dynamic> json) {
    return Prices(type: json['type'], price: json['price'].toString());
  }
}
