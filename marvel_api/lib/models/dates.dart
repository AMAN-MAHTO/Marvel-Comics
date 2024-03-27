class Dates {
  final String? type;
  final String? date;

  Dates({required this.type, required this.date});

  factory Dates.fromMap(Map<String, dynamic> json) {
    return Dates(type: json['type'], date: json['date']);
  }
}
