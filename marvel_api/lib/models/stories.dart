class Stories {
  final int available;
  final String collectionURI;
  final List<Items> items;
  final int returned;

  Stories(
      {required this.available,
      required this.collectionURI,
      required this.items,
      required this.returned});

  factory Stories.fromMap(Map<String, dynamic> json) {
    var items = <Items>[];
    if (json['items'] != null) {
      
      json['items'].forEach((v) {
        items.add(new Items.fromMap(v));
      });
    }
    return Stories(
          collectionURI: json['collectionURI'],
          available: json['available'],
          items: items,
          returned: json['returned']);
    
    
  }

}

class Items {
  String? resourceURI;
  String? name;
  String? type;

  Items({required this.resourceURI,required this.name,required this.type});

  factory Items.fromMap(Map<String, dynamic> json) {
    return Items(resourceURI: json['resourceURI'], name: json['name'], type: json['type']);
   
  }

  
}
